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

ActiveRecord::Schema.define(version: 20160917102005) do

  create_table "candidates", force: :cascade do |t|
    t.string   "first_name",     limit: 20,                   null: false
    t.string   "last_name",      limit: 25,                   null: false
    t.date     "dob",                                         null: false
    t.string   "gender",         limit: 255,                  null: false
    t.string   "email",          limit: 100,                  null: false
    t.string   "marital_status", limit: 255
    t.boolean  "status",                       default: true
    t.text     "languages",      limit: 65535
    t.text     "summary",        limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "course_scores", force: :cascade do |t|
    t.integer  "qualification_id", limit: 4
    t.string   "course",           limit: 255, null: false
    t.date     "start_year"
    t.date     "end_year",                     null: false
    t.float    "score",            limit: 24,  null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "candidate_id", limit: 4
    t.string   "course",       limit: 255, null: false
    t.string   "domain",       limit: 255, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
