module Statistics
  class << self
    def stats params, user
      return {status: 0} unless params['stats_type']

      if params['id']
        single_app_stats params, user
      elsif params['track_ids']
        multi_apps_stats params, user
      else
        {status: 0}
      end
    end

    private

    def single_app_stats params, user
      case params['stats_type'].downcase
        when 'daily'
          data = Statistics::Daily.new(params['id'], params).stats
          data.nil? ? {status: 0} : {status: 1, daily_stats: data}
        when 'hourly'
          data = Statistics::Hourly.new(params['id'], params).stats
          data.nil? ? {status: 0} : {status: 1, hourly_stats: data}
        when 'daily_hourly'
          single_output_daily_and_hourly params, user
        else
          {status: 0}
      end
    end

    def single_output_daily_and_hourly params, user
      daily_stats = Statistics::Daily.new(params['id'], params).stats
      hourly_stats = Statistics::Hourly.new(params['id'], params).stats

      if daily_stats.nil? or hourly_stats.nil?
        {status: 0}
      else
        {
            status: 1,
            daily_stats: daily_stats,
            hourly_stats: hourly_stats
        }
      end
    end

    def multi_apps_stats params, user
      case params['stats_type'].downcase
        when 'daily'
          multi_apps_daily_stats(params, user)
        when 'hourly'
          multi_apps_hourly_stats(params, user)
        when 'daily_hourly'
          multi_apps_daily_hourly_stats params, user
        else
          {status: 0}
      end
    end

    def multi_apps_daily_stats params, user
      data = {}
      params['track_ids'].split(',').each do |track_id|
        track_id = track_id.strip.to_i
        next if track_id == 0
        if (tmp = Statistics::Daily.new(track_id, params).stats)
          data[track_id.to_s] = tmp
        end
      end
      {status: 1, daily_stats: data}
    end

    def multi_apps_hourly_stats params, user
      data = {}
      params['track_ids'].split(',').each do |track_id|
        track_id = track_id.strip.to_i
        next if track_id == 0
        if (tmp = Statistics::Hourly.new(track_id, params).stats)
          data[track_id.to_s] = tmp
        end
      end
      {status: 1, hourly_stats: data}
    end

    def multi_apps_daily_hourly_stats params, user
      daily_data, hourly_data = {}, {}

      params['track_ids'].split(',').each do |track_id|
        track_id = track_id.strip.to_i
        next if track_id == 0

        if (tmp = Statistics::Daily.new(track_id, params).stats)
          daily_data[track_id.to_s] = tmp
        end

        if (tmp = Statistics::Hourly.new(track_id, params).stats)
          hourly_data[track_id.to_s] = tmp
        end

      end
      {daily_stats: daily_data, hourly_stats: hourly_data}
    end

  end
end