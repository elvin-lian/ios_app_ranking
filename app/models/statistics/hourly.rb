module Statistics
  class Hourly < BaseStats

    def get_stats table_name
      return [] unless ActiveRecord::Base.connection.table_exists? table_name
      key = 'hourly_stats_' + table_name.to_s + self.ios_app.id.to_s + self.begin_at.to_s + self.end_at.to_s
      Rails.cache.fetch(md5(key), expires_in: expires_in) do
        hash_data = {}
        RankBase.table_name = table_name
        RankBase.select('added_at, rank').where('ios_app_id = ? AND added_at >= ? AND added_at < ?', self.ios_app.id, self.begin_at, self.end_at).each do |rb|
          hash_data[rb.added_at.to_s] = rb.rank
        end
        fill_full_datetime hash_data, 1.hour
      end
    end

  end
end