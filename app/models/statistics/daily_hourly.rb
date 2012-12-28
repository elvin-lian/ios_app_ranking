module Statistics
  class DailyHourly < BaseStats

    def stats
      res = {status: 0}
      return res if self.ios_app.nil?

      tmp_params = self.params
      tmp_params['end_at'] = Time.now.utc
      tmp_params['begin_at'] = tmp_params[:end_at] - 24.days
      daily_stats = Statistics::Daily.new(self.params).stats

      tmp_params = self.params
      tmp_params['end_at'] = Time.now.beginning_of_hour.utc
      tmp_params['begin_at'] = tmp_params[:end_at] - 24.hours
      hourly_stats = Statistics::Hourly.new(tmp_params).stats


      res = {status: 1}
      res[:daily_stats] = daily_stats[:stats] if daily_stats[:stats]
      res[:hourly_stats] = hourly_stats[:stats] if hourly_stats[:stats]
      res
    end

  end
end