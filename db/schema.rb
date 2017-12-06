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

ActiveRecord::Schema.define(version: 20171205122041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.text "street"
    t.string "city"
    t.string "state"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_addresses_on_property_id"
  end

  create_table "landlords", force: :cascade do |t|
    t.text "address"
    t.string "name"
    t.bigint "mobile_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "max_prices", force: :cascade do |t|
    t.decimal "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "min_prices", force: :cascade do |t|
    t.decimal "min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.text "location"
    t.integer "price"
    t.integer "member"
    t.integer "security_deposit"
    t.bigint "user_id"
    t.bigint "property_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "property_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "renters", force: :cascade do |t|
    t.text "address"
    t.string "name"
    t.bigint "mobile_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.text "location"
    t.integer "max"
    t.integer "min"
    t.bigint "property_type_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_type_id"], name: "index_requirements_on_property_type_id"
    t.index ["user_id"], name: "index_requirements_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.text "location"
    t.bigint "max_price_id"
    t.bigint "min_price_id"
    t.bigint "property_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["max_price_id"], name: "index_searches_on_max_price_id"
    t.index ["min_price_id"], name: "index_searches_on_min_price_id"
    t.index ["property_type_id"], name: "index_searches_on_property_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "mobile_no"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "properties"
  add_foreign_key "properties", "property_types"
  add_foreign_key "properties", "users"
  add_foreign_key "requirements", "property_types"
  add_foreign_key "requirements", "users"
  add_foreign_key "searches", "max_prices"
  add_foreign_key "searches", "min_prices"
  add_foreign_key "searches", "property_types"
end
