class RssFeed < ActiveRecord::Base
  attr_accessible :country, :feed_genre, :feed_type, :url

  validates_presence_of :country, :feed_genre, :feed_type, :url
  validates_uniqueness_of :url

  def rank_table_name
    RankBase.format_table_name(self.country, self.feed_type, self.feed_genre)
  end

end
