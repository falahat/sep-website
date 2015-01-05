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

ActiveRecord::Schema.define(version: 20150105033012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brothers", force: :cascade do |t|
    t.string   "name"
    t.string   "pledge_class"
    t.date     "grad_year"
    t.integer  "jobs_id"
    t.integer  "companies_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "description"
    t.string   "image_url"
    t.string   "major"
    t.string   "minor"
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "jobs_id"
    t.integer  "brothers_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_url"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "role"
    t.text     "description"
    t.date     "start"
    t.date     "end"
    t.integer  "brother_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
