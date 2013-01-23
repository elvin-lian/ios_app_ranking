class ToolLookUp
  class << self

    def max_retries
      15
    end

    def added_at
      @added_at ||= Time.now.utc.beginning_of_hour.to_formatted_s(:db)
    end

    def batch_run country, feed_type
      country = country.downcase
      feed_type = feed_type.downcase
      RssFeed.where(country: country, feed_type: feed_type).each do |feed|
        i = 0
        is_break = false
        while i < 5 and !is_break
          i += 1
          is_break = _run(feed)
        end
      end
      true
    end

    def run_one rss_reed_id
      if (feed = RssFeed.find_by_id(rss_reed_id))
        _run(feed)
      else
        false
      end
    end

    def _run feed
      data = get_data(feed.url)
      res = save(feed.rank_table_name, add_feed_info_to_apps(feed, data))
      res ? true : false
    end

    def fetch_by_url url
      res = nil
      return res if url.blank?

      retries = 0
      begin
        if retries != 0
          Rails.logger.info("==#{Time.now.utc.to_s}--added_at: #{added_at}, Itunes lookup #{url} error retry, run: #{retries}")
        end

        while res.nil? and retries < max_retries
          response = CurbFu.get(url)
          if response.success? and response.body.strip != ''
            if response["Content-Encoding"].to_s.downcase == 'gzip'
              res = JSON.parse(ActiveSupport::Gzip.decompress(response.body))
            else
              res = JSON.parse(response.body)
            end
          else
            retries += 1
            Rails.logger.info("==#{Time.now.utc.to_s}--added_at: #{added_at}, Itunes lookup #{url} null error: run: #{retries}")
          end
        end

      rescue => error
        retries += 1
        Rails.logger.info("==#{Time.now.utc.to_s}--added_at: #{added_at}, Itunes lookup #{url} error: #{error}, run: #{retries}")
        sleep(retries + retries * 2)
        retry if retries < max_retries
      end
      res
    end

    def format_feed_result feed_result
      return nil unless feed_result.is_a?(Hash) and (feed = feed_result['feed'])

      data = {:updated => nil, :apps => [], added_at: added_at}

      # updated_at
      data[:updated] = Time.parse(feed['updated']['label']).utc.to_formatted_s(:db) if feed['updated']

      # app
      feed['entry'].each { |app| data[:apps] << format_app_at_feed_result(app) } if feed['entry']

      data
    end

    private

    def get_data feed_url
      retries = 0
      data = nil
      while retries < max_retries and (data.nil? or data[:updated].nil? or data[:apps].nil? or data[:apps].size < 1)
        data = format_feed_result fetch_by_url(feed_url)
        retries += 1
        sleep(retries + retries * 2)
        Rails.logger.info "==#{Time.now.utc.to_s}--added_at: #{added_at}, url: #{feed_url} run: #{retries}"
      end
      data
    end

    def save rank_table_name, data
      return nil unless data and data[:updated] and data[:apps].size > 0
      saved_count = 0
      rank = 0
      data[:apps].each do |app|
        if (a = IosApp.find_by_track_id(app[:track_id]))
          feed_type_arr = a.feed_type.to_s.split(',')
          feed_type_arr << app[:feed_type]
          a.feed_type = feed_type_arr.uniq.join(',')

          feed_genre_arr = a.feed_genre.to_s.split(',')
          feed_genre_arr << app[:feed_genre]
          a.feed_genre = feed_genre_arr.uniq.join(',')

          feed_country_arr = a.feed_country.to_s.split(',')
          feed_country_arr << app[:feed_country]
          a.feed_country = feed_country_arr.uniq.join(',')

          a.save
        else
          a = IosApp.create(app)
        end

        if a and a.id
          rank += 1
          rank_base = RankBase.fly_create rank_table_name, {ios_app_id: a.id, rank: rank, added_at: data[:added_at], last_updated: data[:updated]}

          saved_count += 1 if rank_base and rank_base.id
        end
      end
      Rails.logger.debug("============saved_count: #{saved_count}")
      saved_count == 0 ? nil : true
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
          price: app['im:price']['attributes']['amount'].to_f,
          primary_genre_id: app['category']['attributes']['im:id'],
          track_id: app['id']['attributes']['im:id'],
          track_name: app['im:name']['label'],
          track_view_url: app['link'].first['attributes']['href']
      }
    end
  end
end