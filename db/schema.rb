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

ActiveRecord::Schema.define(version: 20160220170634) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "event"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.string   "venue"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "organizer"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.text     "description"
    t.string   "startTime"
    t.string   "endTime"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "imagebig_file_name"
    t.string   "imagebig_content_type"
    t.integer  "imagebig_file_size"
    t.datetime "imagebig_updated_at"
    t.text     "longdescription"
  end

  create_table "options", force: :cascade do |t|
    t.string   "title"
    t.string   "category"
    t.date     "saleEnd"
    t.decimal  "price"
    t.decimal  "fee"
    t.text     "description"
    t.string   "promocode"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "tax"
    t.decimal  "shipping"
  end

  add_index "options", ["event_id"], name: "index_options_on_event_id"

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 12, scale: 3
    t.decimal  "tax",             precision: 12, scale: 3
    t.decimal  "shipping",        precision: 12, scale: 3
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "uuid"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id"

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "order"
    t.string   "amount"
    t.string   "customer_email"
    t.string   "customer_id"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "customer_card"
    t.integer  "order_id"
    t.string   "uuid"
  end

  add_index "purchases", ["order_id"], name: "index_purchases_on_order_id"

  create_table "reservations", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.integer  "age"
    t.string   "gender"
    t.string   "email"
    t.string   "phone"
    t.string   "team"
    t.string   "shirt"
    t.string   "redeemcode"
    t.integer  "option_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "price",      precision: 12, scale: 3
    t.integer  "order_id"
    t.decimal  "tax"
    t.decimal  "shipping"
  end

  add_index "reservations", ["option_id"], name: "index_reservations_on_option_id"
  add_index "reservations", ["order_id"], name: "index_reservations_on_order_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
