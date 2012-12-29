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

    def run_one rss_reed_id
      if (feed = RssFeed.find_by_id(rss_reed_id))
        data = get_data(feed.url)
        save(feed.rank_table_name, add_feed_info_to_apps(feed, data)) if data
        true
      else
        nil
      end
    end

    def fetch_by_url url
      res = nil
      return res if url.blank?

      retries = 0
      max_retries = 10
      begin
        response = Curl::Easy.http_get(url)
        res = JSON.parse(response.body_str) if response.body_str

      rescue => error
        retries += 1
        Rails.logger.debug("==#{Time.now.to_s}, Itunes lookup #{url} error: #{error}, run: #{retries}")
        sleep(retries + retries * 2)
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

    def run country, feed_type, limit, offset
      RssFeed.where(country: country, feed_type: feed_type).limit(limit).offset(offset).each do |feed|
        data = get_data(feed.url)
        save(feed.rank_table_name, add_feed_info_to_apps(feed, data)) if data
      end
      true
    end

    def get_data feed_url
      retries = 0
      max_retries = 10
      data = nil
      while retries < max_retries and (data.nil? or data[:updated].nil? or data[:apps].nil? or data[:apps].size < 1)
        data = format_feed_result fetch_by_url(feed_url)
        retries += 1
        sleep( retries + retries * 2)
        Rails.logger.debug "==#{Time.now.to_s}--#{feed_url} run: #{retries}"
      end
      data
    end

    def save rank_table_name, data
      return nil unless data and data[:updated] and data[:apps].size > 0
      rank = 0
      data[:apps].each do |app|
        if (a = IosApp.find_by_track_id(app[:track_id]))
          feed_type_arr = a.feed_type.to_s.split(',')
          feed_type_arr << app[:feed_type]
          app[:feed_type] = feed_type_arr.uniq.join(',')

          feed_genre_arr = a.feed_genre.to_s.split(',')
          feed_genre_arr << app[:feed_genre]
          app[:feed_genre] = feed_genre_arr.uniq.join(',')

          feed_country_arr = a.feed_country.to_s.split(',')
          feed_country_arr << app[:feed_country]
          app[:feed_country] = feed_country_arr.uniq.join(',')

          a.update_attributes(app)
        else
          a = IosApp.create(app)
        end

        if a and a.id
          rank += 1
          RankBase.fly_create rank_table_name, {ios_app_id: a.id, rank: rank, added_at: data[:added_at], last_updated: data[:updated]}
        end
      end
    end

    def add_feed_info_to_apps feed, data
      apps = []
      data[:apps].each do |app|
        apps << app.merge({
                              :feed_country => feed.country.to_s.downcase,
                              :feed_genre => feed.feed_genre.to_s,
                              :feed_type => feed.feed_type.to_s.gsub(/applications/, '')
                          })
      end
      data[:apps] = apps
      data
    end

    def format_app_at_feed_result app
      {
          artwork_url_100: app['im:image'].last['label'],
          currency: app['im:price']['attributes']['currency'],
          price: app['im:price']['attributes']['amount'].to_d,
          primary_genre_id: app['category']['attributes']['im:id'],
          track_id: app['id']['attributes']['im:id'],
          track_name: app['im:name']['label'],
          track_view_url: app['link'].first['attributes']['href']
      }
    end
  end
end