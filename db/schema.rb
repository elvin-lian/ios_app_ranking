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

ActiveRecord::Schema.define(:version => 20121228072057) do

  create_table "ios_apps", :force => true do |t|
    t.integer  "track_id"
    t.string   "track_name"
    t.decimal  "price",                           :precision => 8, :scale => 2
    t.string   "currency",         :limit => 4
    t.integer  "primary_genre_id"
    t.string   "track_view_url",   :limit => 300
    t.string   "artwork_url_100"
    t.string   "feed_country"
    t.string   "feed_type"
    t.string   "feed_genre"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  add_index "ios_apps", ["track_id"], :name => "index_ios_apps_on_track_id"

  create_table "rank_2012_cn_topfree_0", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_0", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_0", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_0", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6000", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6000", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6000", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6000", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6001", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6001", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6001", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6001", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6002", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6002", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6002", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6002", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6003", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6003", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6003", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6003", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6004", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6004", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6004", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6004", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6005", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6005", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6005", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6005", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6006", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6006", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6006", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6006", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6007", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6007", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6007", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6007", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6008", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6008", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6008", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6008", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6009", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6009", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6009", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6009", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6010", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6010", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6010", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6010", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6011", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6011", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6011", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6011", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6012", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6012", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6012", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6012", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6013", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6013", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6013", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6013", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6014", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6014", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6014", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6014", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6015", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6015", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6015", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6015", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6016", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6016", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6016", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6016", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6017", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6017", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6017", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6017", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6018", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6018", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6018", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6018", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6020", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6020", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6020", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6020", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6021", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6021", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6021", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6021", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6022", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6022", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6022", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6022", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_topfree_6023", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_topfree_6023", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_topfree_6023", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_topfree_6023", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_0", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_0", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_0", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_0", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6000", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6000", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6000", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6000", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6001", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6001", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6001", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6001", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6002", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6002", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6002", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6002", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6003", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6003", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6003", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6003", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6004", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6004", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6004", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6004", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6005", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6005", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6005", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6005", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6006", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6006", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6006", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6006", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6007", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6007", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6007", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6007", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6008", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6008", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6008", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6008", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6009", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6009", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6009", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6009", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6010", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6010", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6010", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6010", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6011", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6011", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6011", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6011", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6012", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6012", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6012", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6012", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6013", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6013", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6013", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6013", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6014", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6014", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6014", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6014", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6015", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6015", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6015", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6015", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6016", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6016", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6016", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6016", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6017", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6017", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6017", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6017", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6018", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6018", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6018", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6018", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6020", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6020", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6020", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6020", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6021", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6021", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6021", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6021", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6022", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6022", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6022", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6022", ["rank"], :name => "index_rank"

  create_table "rank_2012_cn_toppaid_6023", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_cn_toppaid_6023", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_cn_toppaid_6023", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_cn_toppaid_6023", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_0", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_0", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_0", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_0", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6000", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6000", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6000", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6000", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6001", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6001", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6001", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6001", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6002", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6002", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6002", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6002", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6003", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6003", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6003", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6003", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6004", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6004", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6004", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6004", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6005", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6005", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6005", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6005", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6006", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6006", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6006", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6006", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6007", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6007", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6007", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6007", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6008", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6008", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6008", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6008", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6009", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6009", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6009", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6009", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6010", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6010", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6010", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6010", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6011", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6011", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6011", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6011", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6012", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6012", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6012", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6012", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6013", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6013", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6013", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6013", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6014", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6014", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6014", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6014", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6015", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6015", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6015", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6015", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6016", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6016", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6016", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6016", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6017", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6017", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6017", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6017", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6018", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6018", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6018", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6018", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6020", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6020", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6020", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6020", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6021", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6021", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6021", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6021", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6022", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6022", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6022", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6022", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_topfree_6023", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_topfree_6023", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_topfree_6023", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_topfree_6023", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_0", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_0", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_0", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_0", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6000", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6000", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6000", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6000", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6001", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6001", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6001", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6001", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6002", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6002", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6002", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6002", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6003", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6003", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6003", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6003", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6004", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6004", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6004", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6004", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6005", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6005", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6005", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6005", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6006", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6006", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6006", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6006", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6007", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6007", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6007", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6007", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6008", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6008", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6008", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6008", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6009", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6009", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6009", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6009", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6010", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6010", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6010", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6010", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6011", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6011", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6011", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6011", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6012", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6012", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6012", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6012", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6013", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6013", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6013", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6013", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6014", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6014", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6014", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6014", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6015", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6015", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6015", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6015", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6016", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6016", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6016", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6016", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6017", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6017", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6017", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6017", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6018", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6018", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6018", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6018", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6020", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6020", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6020", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6020", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6021", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6021", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6021", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6021", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6022", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6022", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6022", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6022", ["rank"], :name => "index_rank"

  create_table "rank_2012_us_toppaid_6023", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  add_index "rank_2012_us_toppaid_6023", ["added_at"], :name => "index_added_at"
  add_index "rank_2012_us_toppaid_6023", ["ios_app_id"], :name => "index_ios_app_id"
  add_index "rank_2012_us_toppaid_6023", ["rank"], :name => "index_rank"

  create_table "rank_2013_cn_topfree_6018", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  create_table "rank_2013_cn_toppaid_6018", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  create_table "rank_2013_us_topfree_6018", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  create_table "rank_2013_us_toppaid_6018", :force => true do |t|
    t.integer  "ios_app_id"
    t.integer  "rank",         :default => 0
    t.datetime "added_at"
    t.datetime "last_updated"
  end

  create_table "rss_feeds", :force => true do |t|
    t.string   "url"
    t.string   "country",    :limit => 2
    t.string   "feed_type",  :limit => 100
    t.string   "feed_genre", :limit => 10
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "app_key",    :limit => 32
    t.string   "app_secret", :limit => 64
    t.boolean  "status",                   :default => true
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "users", ["app_key"], :name => "index_users_on_app_key"
  add_index "users", ["status"], :name => "index_users_on_status"

end
