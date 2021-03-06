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

ActiveRecord::Schema.define(:version => 20121231182050) do

  create_table "adds", :force => true do |t|
    t.integer "user_id"
    t.integer "artist_id"
  end

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.integer  "tracks"
    t.datetime "release_date"
  end

  create_table "artist_similars", :force => true do |t|
    t.string   "artist_name"
    t.string   "similar_name"
    t.integer  "artist_id"
    t.integer  "similar_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "artists", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "contains", :force => true do |t|
    t.integer "album_id"
    t.integer "song_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friendships", ["user_id", "friend_id"], :name => "index_friendships_on_user_id_and_friend_id"

  create_table "participates", :force => true do |t|
    t.integer "artist_id"
    t.integer "album_id"
  end

  create_table "reviews", :force => true do |t|
    t.text     "comments"
    t.integer  "user_id"
    t.integer  "artist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.string  "name"
    t.integer "track"
    t.integer "duration"
    t.string  "link"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "profile_name"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
