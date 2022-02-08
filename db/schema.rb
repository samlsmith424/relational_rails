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

ActiveRecord::Schema.define(version: 2022_02_05_080250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.string "body_style"
    t.integer "mpg"
    t.boolean "electrical"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dealership_id"
    t.index ["dealership_id"], name: "index_cars_on_dealership_id"
  end

  create_table "dealerships", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "employees"
    t.boolean "offer_financing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacity"
    t.boolean "is_open"
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.string "section"
    t.integer "recommended_sets"
    t.integer "recommended_reps"
    t.boolean "is_broken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gym_id"
    t.index ["gym_id"], name: "index_machines_on_gym_id"
  end

  add_foreign_key "cars", "dealerships"
  add_foreign_key "machines", "gyms"
end
