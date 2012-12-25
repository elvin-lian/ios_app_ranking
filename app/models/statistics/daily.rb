module Statistics
  class Daily < BaseStats

    def get_stats table_name
      return [] unless ActiveRecord::Base.connection.table_exists? table_name
      sql = "SELECT * FROM (SELECT Date(added_at) AS dd, rank FROM `#{table_name}` WHERE (ios_app_id = #{self.ios_app.id} AND added_at >= '#{self.begin_at.to_formatted_s(:db)}' AND added_at < '#{self.end_at.to_formatted_s(:db)}') ORDER BY rank ASC) AS tmp_table GROUP BY dd"
      Rails.cache.fetch(md5(sql), expires_in: expires_in) do
        data = []
        RankBase.table_name = table_name
        RankBase.connection.select_all(sql).each do |rb|
          data << {datetime: parse_datetime("#{rb['dd']} 00:00:00").to_s, rank: rb['rank']}
        end
        data
      end
    end
    #
    #def fill_full_datetime data
    #  res = []
    #  first_datetime = Time.parse(data.keys.first)
    #  last_datetime = Time.parse(data.keys.last)
    #
    #  while first_datetime <= last_datetime
    #    rank = data[first_datetime.to_s] ? data[first_datetime.to_s] : 0
    #    res << {datetime: first_datetime.to_s, rank: rank}
    #    first_datetime += 1.hour
    #  end
    #
    #  res
    #end
  end
end