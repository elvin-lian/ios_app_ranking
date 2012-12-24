module Statistics
  class Hourly < BaseStats

    def get_stats table_name
      return [] unless ActiveRecord::Base.connection.table_exists? table_name
      data = []
      RankBase.table_name = table_name
      RankBase.select('added_at, rank').where('ios_app_id = ? AND added_at >= ? AND added_at < ?', self.ios_app.id, self.begin_at, self.end_at).each do |rb|
        data << {datetime: rb.added_at.to_s, rank: rb.rank}
      end
      data
    end

  end
end