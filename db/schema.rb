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

ActiveRecord::Schema.define(version: 20150106034029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brothers", force: :cascade do |t|
    t.string   "name"
    t.date     "grad_year"
    t.text     "description"
    t.string   "major"
    t.string   "image_url"
    t.integer  "jobs_id"
    t.integer  "pledge_class_id"
    t.integer  "ventures_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo_url"
    t.boolean  "isVenture"
    t.integer  "brothers_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "role"
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.integer  "brother_id"
    t.integer  "companies_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pledge_classes", force: :cascade do |t|
    t.string   "name"
    t.date     "pledge_semester"
    t.integer  "brothers_id"
    t.integer  "professional_event_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "professional_events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.integer  "pledge_class_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "rush_events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "subtitle"
    t.date     "time"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "image_url"
    t.text     "text"
    t.string   "author"
    t.string   "author_role"
    t.inet     "verticle_alignment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
