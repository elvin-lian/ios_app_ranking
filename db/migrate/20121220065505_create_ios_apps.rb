class CreateIosApps < ActiveRecord::Migration
  def change
    create_table :ios_apps do |t|
      t.integer :track_id, :limit => 4
      t.string :track_name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :currency, :limit => 4
      t.integer :primary_genre_id
      t.string :track_view_url, :limit => 300
      t.string :artwork_url_100

      t.string :feed_country
      t.string :feed_type
      t.string :feed_genre

      t.timestamps
    end

    add_index :ios_apps, :track_id
  end
end
