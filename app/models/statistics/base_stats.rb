module Statistics
  class BaseStats

    attr_accessor :countries, :feed_types, :app_genres, :ios_app, :params, :year, :begin_at, :end_at

    def initialize params
      self.countries = self.feed_types = self.app_genres = []
      self.params = params
      if (self.ios_app = IosApp.find_by_track_id(params['track_id']))
        init_countries
        init_feed_types
        init_app_genres
      end
      init_date
    end

    def stats
      res = {status: 0}
      return res if self.ios_app.nil?

      stats = {}
      self.countries.each do |country|
        self.feed_types.each do |feed_type|
          self.app_genres.each do |app_genre|
            table_name = RankBase.format_table_name(country, feed_type, app_genre, self.year)

            next unless ActiveRecord::Base.connection.table_exists? table_name

            if (current_rank = get_current_rank(table_name))
              stats[country] ||= {}
              stats[country][app_genre] ||= {}
              stats[country][app_genre][:name] = I18n.t("feed.genre_#{app_genre}")
              stats[country][app_genre][:current_rank] = current_rank
              stats[country][app_genre][:data] = get_stats(table_name)
            end
          end
        end
      end
      {status: 1, stats: stats}
    end

    def get_stats table_name
      []
    end

    def get_current_rank table_name
      RankBase.table_name = table_name
      if (rb = RankBase.where(ios_app_id: self.ios_app.id).order('id DESC').first)
        if Time.now - rb.added_at <= 1.hour
          rb.rank
        else
          0
        end
      else
        nil
      end
    end

    def parse_datetime datetime
      res = nil
      begin
        res = Time.parse(datetime).utc
      rescue => error
      end
      res
    end

    private

    def init_countries
      country_code = []
      ItunesApp::Feed.countries.values.each { |country| country_code << country.downcase }
      if self.params['country'] and self.params['country'].downcase.in?(country_code)
        self.countries = [self.params['country'].downcase]
      else
        self.countries = self.ios_app.feed_country.split(',')
      end
    end

    def init_feed_types
      feed_types = []
      ItunesApp::Feed.feed_type.values.each { |feed_type| feed_types << feed_type.downcase.gsub(/applications/, '') }
      if self.params['feed_type'] and self.params['feed_type'].downcase.gsub(/applications/, '').in?(feed_types)
        self.feed_types = [self.params['feed_type'].downcase.gsub(/applications/, '')]
      else
        self.feed_types = self.ios_app.feed_type.split(',')
      end
    end

    def init_app_genres
      app_genres = []
      ItunesApp::Feed.genres.values.each { |genre| app_genres << genre.to_i }
      if self.params['app_genre'] and self.params['app_genre'].to_i.in?(app_genres)
        self.app_genres = [self.params['app_genre'].to_i]
      else
        self.app_genres = self.ios_app.feed_genre.split(',')
      end
    end

    def init_date
      date = self.params['date'] ? parse_datetime(self.params['date']) : nil
      if self.params['begin_at'] and self.params['end_at']
        self.begin_at = parse_datetime(self.params['begin_at'])
        self.end_at = parse_datetime(self.params['end_at'])
      end

      if date
        self.begin_at = date
        self.end_at = date + 1.day
      elsif self.begin_at and self.end_at
        self.end_at = self.end_at + 1.day
      else
        self.begin_at = (Time.now - 30.days).beginning_of_day.utc
        self.end_at = Time.now
      end

      self.year = self.begin_at.year
      nil
    end

  end
end