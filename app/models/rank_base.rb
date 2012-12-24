class RankBase < ActiveRecord::Base
  attr_accessible :added_at, :ios_app_id, :rank, :last_updated

  validates_presence_of :added_at, :ios_app_id, :rank
  validates_uniqueness_of :added_at, :scope => :ios_app_id

  self.table_name = nil

  def self.fly_create table_name, fields
    create_table!(table_name)
    RankBase.table_name = table_name
    RankBase.create(fields)
  end

  def self.create_table! table_name
    return nil if ActiveRecord::Base.connection.table_exists? table_name

    retires = 0
    begin
      queries = []
      queries << "DROP TABLE IF EXISTS #{table_name};"
      queries << "CREATE TABLE `#{table_name}` (`id` int(11) DEFAULT NULL auto_increment PRIMARY KEY, `ios_app_id` int(11), `rank` int(11) DEFAULT 0, `added_at` datetime, `last_updated` datetime) ENGINE=MyISAM;"
      queries << "CREATE INDEX `index_ios_app_id` ON `#{table_name}` (`ios_app_id`);"
      queries << "CREATE INDEX `index_added_at` ON `#{table_name}` (`added_at`);"
      queries << "CREATE INDEX `index_rank` ON `#{table_name}` (`rank`);"

      queries.each { |sql| ActiveRecord::Base.connection.execute(sql) }
    rescue => error
      Rails.logger.info("====== #{error}")
      retires += 1
      retry if retires < 6
    end
  end

  def self.format_table_name country, feed_type, app_genre, year = nil
    if country.blank? or feed_type.blank? or app_genre.blank?
      raise 'error table name'
    else
      feed_type = feed_type.gsub(/applications/, '')
      year = Time.now.year if year.nil?
      "rank_#{year}_#{country}_#{feed_type}_#{app_genre}"
    end
  end
end
