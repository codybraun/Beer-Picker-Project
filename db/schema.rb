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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "beers", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created"
    t.integer  "brewery_id"
  end

  add_index "beers", ["brewery_id"], name: "index_beers_on_brewery_id"

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created"
    t.string   "description"
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created"
  end

  add_index "follows", ["followed_id"], name: "index_follows_on_followed_id"
  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars"
    t.datetime "created"
    t.string   "description"
    t.integer  "beer_id"
  end

  add_index "ratings", ["beer_id"], name: "index_ratings_on_beer_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "bio"
    t.datetime "created"
    t.string   "email"
    t.string   "image_url"
  end

end
