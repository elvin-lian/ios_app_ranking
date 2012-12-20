class ToolLookUp
  class << self

    def run_all
      RssFeed.all do |feed|
        data = format_feed_result fetch_by_url(feed.url)
        save(feed, data) if data
      end
    end

    def save feed, data
      return nil unless data and data[:updated_at] and data[:apps].size > 0
      rank = 0
      data[:apps].each do |app|
        if (a = IosApp.create(app)) and a.id
          rank += 1
          RankBase.fly_create feed.rank_table_name, {ios_app_id: a.id, rank: rank, added_at: data[:updated_at]}
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
      data = {:updated_at => nil, :apps => []}

      # updated_at
      data[:updated_at] = Time.parse(feed['updated']['label']).utc.at_beginning_of_hour.to_formatted_s(:db) if feed['updated']

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