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

ActiveRecord::Schema.define(version: 20140603204925) do

  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "size"
    t.integer  "shop_id"
    t.decimal  "price",       precision: 8, scale: 2
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "website"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "name"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

  create_table "shops", force: true do |t|
    t.string   "name"
    t.integer  "merchant_id"
    t.string   "logo"
    t.string   "shop_bucket"
    t.string   "url"
    t.string   "address"
    t.float    "lat"
    t.float    "lon"
    t.string   "facebook"
    t.string   "twitter"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
