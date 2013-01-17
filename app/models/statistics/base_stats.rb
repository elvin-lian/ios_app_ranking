module Statistics
  class BaseStats

    attr_accessor :countries, :feed_types, :app_genres, :ios_app, :params, :years, :begin_at, :end_at

    def initialize track_id, params
      self.countries = self.feed_types = self.app_genres = []
      self.params = params

      if (self.ios_app = IosApp.find_by_track_id(track_id))
        init_countries
        init_feed_types
        init_app_genres
      end
      init_date
      init_year
    end

    def stats
      return nil if self.ios_app.nil?

      stats = {}
      self.countries.each do |country|
        self.feed_types.each do |feed_type|
          self.app_genres.each do |app_genre|
            started_log_at = get_started_log_at(country, feed_type, app_genre)
            self.years.each do |year|
              table_name = RankBase.format_table_name(country, feed_type, app_genre, year)

              next unless ActiveRecord::Base.connection.table_exists? table_name

              if (current_rank = get_current_rank(table_name))
                stats[country] ||= {}
                stats[country][app_genre] ||= {}
                stats[country][app_genre][:name] = I18n.t("feed.genre_#{app_genre}")
                stats[country][app_genre][:current_rank] = current_rank
                stats[country][app_genre][:started_at] = started_log_at
                stats[country][app_genre][:data] ||= []
                stats[country][app_genre][:data] += get_stats(table_name, fixed_begin_at(year), fixed_end_at(year))
              end
            end
          end
        end
      end
      stats
    end

    def fixed_begin_at year
      if self.begin_at.localtime.year < year
        (self.begin_at + 1.year).localtime.beginning_of_year.utc
      else
        self.begin_at.utc
      end
    end

    def fixed_end_at year
      if self.end_at.localtime.year > year
        self.end_at.localtime.beginning_of_year.utc
      else
        self.end_at.utc
      end
    end

    def get_stats table_name, begin_at, end_at
      []
    end

    def fill_full_datetime data, begin_at, end_at, range = 1.day
      res = []
      i = 0
      while begin_at < end_at and i < 10000
        rank = data[begin_at.to_s] ? data[begin_at.to_s] : no_rank_number
        res << {datetime: begin_at.to_s, rank: rank}
        begin_at += range
        i += 1
      end
      res
    end

    def get_current_rank table_name
      key = "current_ios_app_rank_#{self.ios_app.id}_#{table_name}"
      res = Rails.cache.fetch(md5(key), expires_in: expires_in) do
        RankBase.table_name = table_name
        if (rb = RankBase.where(ios_app_id: self.ios_app.id).order('id DESC').first)
          if Time.now - rb.added_at <= 2.hour
            rb.rank
          else
            over_rank_number
          end
        else
          -1
        end
      end
      res.to_i == -1 ? nil : res.to_i
    end

    def get_started_log_at country, feed_type, app_genre
      key = "started_log_at_#{self.ios_app.id}_#{country}_#{feed_type}_#{app_genre}"
      log_at = Rails.cache.fetch(md5(key), expires_in: 30.days.to_i) do
        res = ''
        years = [Time.now.year - 1, Time.now.year]
        years.delete(2012) if Rails.env.production? # Production deploy at 2013
        years.each do |year|
          RankBase.table_name = RankBase.format_table_name(country, feed_type, app_genre, year)
          if (rb = RankBase.where(ios_app_id: self.ios_app.id).order('id ASC').first)
            res = rb.added_at.to_s
            break
          end
        end
        res
      end
      log_at = Time.now.beginning_of_hour.utc.to_s if log_at == ''
      log_at
    end

    def parse_datetime datetime
      res = nil
      begin
        res = Time.parse(datetime).utc
      rescue => error
      end
      res
    end

    def expires_in
      900
    end

    def over_rank_number
      301
    end

    def no_rank_number
      301
    end

    def md5 string
      Digest::MD5.hexdigest(string)
    end

    def stats_type
      self.class.name
    end

    private

    def init_countries
      country_code = []
      ItunesApp::Feed.countries.values.each { |country| country_code << country.downcase }
      if self.params['country'] and self.params['country'].downcase.in?(country_code)
        self.countries = [self.params['country'].downcase]
      else
        #self.countries = self.ios_app.feed_country.split(',')
        self.countries = %w(cn)
      end
    end

    def init_feed_types
      feed_types = []
      ItunesApp::Feed.feed_type.values.each { |feed_type| feed_types << feed_type.downcase.gsub(/applications/, '') }
      if self.params['feed_type'] and self.params['feed_type'].downcase.gsub(/applications/, '').in?(feed_types)
        self.feed_types = [self.params['feed_type'].downcase.gsub(/applications/, '')]
      else
        self.feed_types = self.ios_app.feed_type.to_s.split(',')
      end
    end

    def init_app_genres
      app_genres = []
      ItunesApp::Feed.genres.values.each { |genre| app_genres << genre.to_i }
      if self.params['app_genre'] and self.params['app_genre'] != ''
        self.app_genres = []
        self.params['app_genre'].to_s.split(',').each do |g|
          self.app_genres << g.to_i if g.to_i.in?(app_genres)
        end
        self.app_genres = self.app_genres.uniq
      else
        self.app_genres = self.ios_app.feed_genre.to_s.split(',')
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
        case stats_type
          when 'Statistics::Daily'
            self.begin_at = self.begin_at.localtime.beginning_of_day.utc
            self.end_at = self.end_at.localtime.utc
          when 'Statistics::Hourly'
            self.begin_at = self.begin_at.localtime.beginning_of_hour.utc
            self.end_at = self.end_at.localtime.beginning_of_hour.utc
          else
            self.begin_at = self.begin_at.localtime.beginning_of_day.utc
            self.end_at = self.end_at.localtime.beginning_of_hour.utc
        end
      else
        case stats_type
          when 'Statistics::Daily'
            self.begin_at = (Time.now - 23.days).beginning_of_day.utc
            self.end_at = Time.now.beginning_of_hour.utc
          when 'Statistics::Hourly'
            self.begin_at = (Time.now - 24.hours).beginning_of_hour.utc
            self.end_at = Time.now.beginning_of_hour.utc
          else
            self.begin_at = Time.now.beginning_of_day.utc
            self.end_at = Time.now.beginning_of_hour.utc
        end
      end

      if Rails.env.production? # Production deploy at 2013
        if self.begin_at.year < 2013
          case stats_type
            when 'Statistics::Daily'
              self.begin_at = Time.now.beginning_of_year.utc
            else
              self.begin_at = Time.now.beginning_of_day.utc
          end
        end
      end

      if self.begin_at > Time.now.utc
        self.begin_at = Time.now.beginning_of_day.utc
        self.end_at = self.begin_at + 1.day
      end

      if self.begin_at > self.end_at or (self.end_at - self.begin_at > 300.days)
        self.end_at = self.begin_at + 1.days
      end

      self.end_at = Time.now.beginning_of_day.utc + 1.day if self.end_at > Time.now.utc

      nil
    end

    def init_year
      self.years = [self.begin_at.year, self.end_at.year].uniq
    end

  end
end