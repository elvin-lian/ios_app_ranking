class IosApp < ActiveRecord::Base
  attr_accessible :artwork_url_100, :currency, :description, :price, :primary_genre_id, :track_id, :track_name, :track_view_url

  validates_presence_of :track_id, :primary_genre_id
  validates_uniqueness_of :track_id
end
