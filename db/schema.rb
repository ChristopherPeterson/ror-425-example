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

ActiveRecord::Schema.define(version: 20160616001336) do

  create_table "foods", primary_key: "food_code", force: :cascade do |t|
    t.string   "display_name",         limit: 255
    t.float    "portion_default",      limit: 24
    t.float    "portion_amount",       limit: 24
    t.string   "portion_display_name", limit: 255
    t.float    "factor",               limit: 24
    t.float    "portion_increment",    limit: 24
    t.float    "multiplier",           limit: 24
    t.float    "grains",               limit: 24
    t.float    "whole_grains",         limit: 24
    t.float    "vegetables",           limit: 24
    t.float    "orange_vegetables",    limit: 24
    t.float    "drkgreen_vegetables",  limit: 24
    t.float    "starchy_vegetables",   limit: 24
    t.float    "other_vegetables",     limit: 24
    t.float    "fruits",               limit: 24
    t.float    "milk",                 limit: 24
    t.float    "meats",                limit: 24
    t.float    "soy",                  limit: 24
    t.float    "drybeans_peas",        limit: 24
    t.float    "oils",                 limit: 24
    t.float    "solid_fats",           limit: 24
    t.float    "added_sugars",         limit: 24
    t.float    "alcohol",              limit: 24
    t.float    "calories",             limit: 24
    t.float    "saturated_fats",       limit: 24
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
