module Statistics
  class Daily < BaseStats

    def get_stats table_name, begin_at, end_at
      return [] unless ActiveRecord::Base.connection.table_exists? table_name
      sql = "SELECT * FROM (SELECT Date(added_at) AS dd, rank FROM `#{table_name}` WHERE (ios_app_id = #{self.ios_app.id} AND added_at >= '#{begin_at.to_formatted_s(:db)}' AND added_at < '#{end_at.to_formatted_s(:db)}') ORDER BY rank ASC) AS tmp_table GROUP BY dd"
      Rails.cache.fetch(md5(sql), expires_in: expires_in) do
        hash_data = {}
        RankBase.table_name = table_name
        RankBase.connection.select_all(sql).each do |rb|
          hash_data[parse_datetime("#{rb['dd']} 00:00:00").to_s] = rb['rank']
        end
        fill_full_datetime hash_data, begin_at, end_at
      end
    end
  end
end