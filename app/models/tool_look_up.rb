class ToolLookUp
  class << self

    def batch_run country, feed_type
      country = country.downcase
      feed_type = feed_type.downcase
      total_count = RssFeed.where(country: country, feed_type: feed_type).count
      limit = (total_count / 2.0).ceil # max poll of db connection is 8
      offset = 0
      threads = []
      while offset < total_count
        threads << Thread.new(offset) do |o|
          run(country, feed_type, limit, o)
          ActiveRecord::Base.connection.close
        end
        offset += limit
      end
      threads.each { |aThread| aThread.join }
      true
    end

    def run country, feed_type, limit, offset
      RssFeed.where(country: country, feed_type: feed_type).limit(limit).offset(offset).each do |feed|
        data = format_feed_result fetch_by_url(feed.url)
        save(feed.rank_table_name, data) if data
      end
      true
    end

    def run_one rss_reed_id
      if (feed = RssFeed.find_by_id(rss_reed_id))
        data = format_feed_result fetch_by_url(feed.url)
        save(feed.rank_table_name, data) if data
        true
      else
        nil
      end
    end

    def save rank_table_name, data
      return nil unless data and data[:updated] and data[:apps].size > 0
      rank = 0
      data[:apps].each do |app|
        if (a = IosApp.find_by_track_id(app[:track_id]))
          if Time.now.to_i - a.updated_at.to_i > 86400 * 2
            a.update_attributes(app)
          end
        else
          a = IosApp.create(app)
        end

        if a and a.id
          rank += 1
          RankBase.fly_create rank_table_name, {ios_app_id: a.id, rank: rank, added_at: data[:added_at], last_updated: data[:updated]}
        end
      end
    end

    def fetch_by_url url
      res = nil
      return res if url.blank?

      retries = 0
      max_retries = 6
      begin
        response = Curl::Easy.http_get(url)
        res = JSON.parse(response.body_str) if response.body_str

      rescue => error
        Rails.logger.debug("==#{Time.now.to_s}, Itunes lookup #{url} error: #{error}")
        retries += 1
        retry if retries < max_retries
      end
      res
    end

    def format_feed_result feed_result
      return nil unless feed_result.is_a?(Hash) and (feed = feed_result['feed'])
      data = {:updated => nil, :apps => [], added_at: Time.now.utc.beginning_of_hour.to_formatted_s(:db)}

      # updated_at
      data[:updated] = Time.parse(feed['updated']['label']).utc.to_formatted_s(:db) if feed['updated']

      # app
      feed['entry'].each { |app| data[:apps] << format_app_at_feed_result(app) } if feed['entry']

      data
    end

    private

    def format_app_at_feed_result app
      {
          artwork_url_100: app['im:image'].last['label'],
          currency: app['im:price']['attributes']['currency'],
          description: app['summary']['label'],
          price: app['im:price']['attributes']['amount'],
          primary_genre_id: app['category']['attributes']['im:id'],
          track_id: app['id']['attributes']['im:id'],
          track_name: app['im:name']['label'],
          track_view_url: app['link'].first['attributes']['href']
      }
    end
  end
end