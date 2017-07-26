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

ActiveRecord::Schema.define(version: 20170725160534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "demands", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "number_of_people"
    t.text     "comment"
    t.string   "location"
    t.datetime "scheduled_at"
    t.integer  "budget_id"
    t.integer  "mood_id"
    t.integer  "status_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["budget_id"], name: "index_demands_on_budget_id", using: :btree
    t.index ["mood_id"], name: "index_demands_on_mood_id", using: :btree
    t.index ["status_id"], name: "index_demands_on_status_id", using: :btree
    t.index ["user_id"], name: "index_demands_on_user_id", using: :btree
  end

  create_table "moods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pings", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "demand_id"
    t.integer  "status_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["demand_id"], name: "index_pings_on_demand_id", using: :btree
    t.index ["restaurant_id"], name: "index_pings_on_restaurant_id", using: :btree
    t.index ["status_id"], name: "index_pings_on_status_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "ping_id"
    t.integer  "status_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ping_id"], name: "index_reservations_on_ping_id", using: :btree
    t.index ["status_id"], name: "index_reservations_on_status_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.text     "description"
    t.string   "lunch_service_opening_at"
    t.string   "lunch_service_closing_at"
    t.string   "dinner_service_opening_at"
    t.string   "dinner_service_closing_at"
    t.integer  "budget_id"
    t.integer  "mood_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["budget_id"], name: "index_restaurants_on_budget_id", using: :btree
    t.index ["mood_id"], name: "index_restaurants_on_mood_id", using: :btree
    t.index ["user_id"], name: "index_restaurants_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_taggings_on_restaurant_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "mobile_phone"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "demands", "budgets"
  add_foreign_key "demands", "moods"
  add_foreign_key "demands", "statuses"
  add_foreign_key "demands", "users"
  add_foreign_key "pings", "demands"
  add_foreign_key "pings", "restaurants"
  add_foreign_key "pings", "statuses"
  add_foreign_key "reservations", "pings"
  add_foreign_key "reservations", "statuses"
  add_foreign_key "restaurants", "budgets"
  add_foreign_key "restaurants", "moods"
  add_foreign_key "restaurants", "users"
  add_foreign_key "taggings", "restaurants"
  add_foreign_key "taggings", "tags"
end
