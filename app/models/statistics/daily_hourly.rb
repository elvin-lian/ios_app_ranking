module Statistics
  class DailyHourly < BaseStats

    def stats
      res = {status: 0}
      return res if self.ios_app.nil?
      daily_stats = Statistics::Daily.new(self.params).stats
      hourly_stats = Statistics::Hourly.new(self.params).stats

      res = {status: 1}
      res[:daily_stats] = daily_stats[:stats] if daily_stats[:stats]
      res[:hourly_stats] = hourly_stats[:stats] if hourly_stats[:stats]
      res
    end

  end
end