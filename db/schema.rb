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

ActiveRecord::Schema.define(version: 2020_03_15_152240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attraction_tags", force: :cascade do |t|
    t.bigint "attraction_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_attraction_tags_on_attraction_id"
    t.index ["tag_id"], name: "index_attraction_tags_on_tag_id"
  end

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.bigint "region_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_attractions_on_city_id"
    t.index ["country_id"], name: "index_attractions_on_country_id"
    t.index ["region_id"], name: "index_attractions_on_region_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "iso_3166_1_alpha2"
    t.string "iso_3166_1_alpha3"
    t.string "iso_3166_1_numeric"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "iso_3166_2"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trip_attractions", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_trip_attractions_on_attraction_id"
    t.index ["trip_id"], name: "index_trip_attractions_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attraction_tags", "attractions"
  add_foreign_key "attraction_tags", "tags"
  add_foreign_key "attractions", "cities"
  add_foreign_key "attractions", "countries"
  add_foreign_key "attractions", "regions"
  add_foreign_key "cities", "countries"
  add_foreign_key "cities", "regions"
  add_foreign_key "regions", "countries"
  add_foreign_key "trip_attractions", "attractions"
  add_foreign_key "trip_attractions", "trips"
end
