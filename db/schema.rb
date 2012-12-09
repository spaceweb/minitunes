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

ActiveRecord::Schema.define(:version => 20121206153430) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.integer  "tracks"
    t.datetime "release_date"
  end

  create_table "artists", :force => true do |t|
    t.string "name"
    t.text   "description"
    t.string "similar"
  end

  create_table "contienes", :force => true do |t|
    t.integer "album_id"
    t.integer "song_id"
  end

  create_table "friends", :force => true do |t|
    t.integer "tunegoer_id"
  end

  create_table "participates", :force => true do |t|
    t.integer "artist_id"
    t.integer "album_id"
  end

  create_table "reviews", :force => true do |t|
    t.text    "comments"
    t.integer "tunegoer_id"
    t.integer "artist_id"
  end

  create_table "songs", :force => true do |t|
    t.string  "name"
    t.integer "track"
    t.integer "duration"
  end

  create_table "tienes", :force => true do |t|
    t.integer "tunegoer_id"
    t.integer "artist_id"
  end

  create_table "tunegoers", :force => true do |t|
    t.string "name"
    t.string "provider"
    t.string "uid"
  end

end
