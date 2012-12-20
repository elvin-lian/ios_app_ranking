class CreateRssFeeds < ActiveRecord::Migration
  def change
    create_table :rss_feeds do |t|
      t.string :url
      t.string :country, :limit => 2
      t.string :feed_type, :limit => 100
      t.string :feed_genre, :limit => 10

      t.timestamps
    end
  end
end
