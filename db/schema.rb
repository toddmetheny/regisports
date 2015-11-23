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

ActiveRecord::Schema.define(version: 20151122205227) do

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
  end

  add_index "options", ["event_id"], name: "index_options_on_event_id"

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "registrations", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "registrations", ["option_id"], name: "index_registrations_on_option_id"

end
