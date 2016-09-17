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

ActiveRecord::Schema.define(version: 20160917105926) do

  create_table "achievements", force: :cascade do |t|
    t.string   "title",        limit: 255, null: false
    t.string   "description",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "achievements", ["candidate_id"], name: "index_achievements_on_candidate_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "admins", ["user_id"], name: "index_admins_on_user_id", using: :btree

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

  create_table "references", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.string   "email",        limit: 255
    t.string   "contact",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "references", ["candidate_id"], name: "index_references_on_candidate_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "achievements", "candidates"
  add_foreign_key "admins", "users"
  add_foreign_key "references", "candidates"
end
