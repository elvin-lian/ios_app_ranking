# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121220065505) do

  create_table "ios_apps", :force => true do |t|
    t.integer  "track_id"
    t.string   "track_name"
    t.decimal  "price",                           :precision => 8, :scale => 2
    t.string   "currency",         :limit => 4
    t.integer  "primary_genre_id"
    t.string   "track_view_url",   :limit => 300
    t.string   "artwork_url_100"
    t.text     "description"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  add_index "ios_apps", ["track_id"], :name => "index_ios_apps_on_track_id"

  create_table "rss_feeds", :force => true do |t|
    t.string   "url"
    t.string   "country",    :limit => 2
    t.string   "feed_type",  :limit => 100
    t.string   "feed_genre", :limit => 10
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
