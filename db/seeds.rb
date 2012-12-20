# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ItunesApp::Feed.countries.values.each do |country|
  ItunesApp::Feed.feed_type.values.each do |type|
    ItunesApp::Feed.genres.values.each do |genre|
      url = "https://itunes.apple.com/#{country}/rss/#{type}/limit=300"
      url << "/genre=#{genre}" if genre != ''
      url << '/json'

      RssFeed.create(country: country, feed_genre: genre == '' ? 0 : genre, feed_type: type, url: url)
    end
  end
end