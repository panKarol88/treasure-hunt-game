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

ActiveRecord::Schema.define(version: 20170601070513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hunters", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "hunters_treasures", id: false, force: :cascade do |t|
    t.integer "hunter_id",   null: false
    t.integer "treasure_id"
    t.index ["hunter_id", "treasure_id"], name: "index_hunters_treasures_on_hunter_id_and_treasure_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "hunter_id"
    t.integer  "treasure_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["hunter_id"], name: "index_requests_on_hunter_id", using: :btree
    t.index ["treasure_id"], name: "index_requests_on_treasure_id", using: :btree
  end

  create_table "treasures", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.string   "address"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "requests", "hunters"
  add_foreign_key "requests", "treasures"
end
