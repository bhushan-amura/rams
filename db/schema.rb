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

ActiveRecord::Schema.define(version: 20160930132835) do

  create_table "admins", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "admins", ["user_id"], name: "index_admins_on_user_id", using: :btree

  create_table "candidate_achievements", force: :cascade do |t|
    t.string   "title",        limit: 255,   null: false
    t.text     "description",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "candidate_achievements", ["candidate_id"], name: "index_candidate_achievements_on_candidate_id", using: :btree

  create_table "candidate_course_scores", force: :cascade do |t|
    t.date     "start_year"
    t.date     "end_year",                    null: false
    t.float    "score",            limit: 24, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "qualification_id", limit: 4
    t.integer  "candidate_id",     limit: 4
  end

  add_index "candidate_course_scores", ["candidate_id"], name: "index_candidate_course_scores_on_candidate_id", using: :btree
  add_index "candidate_course_scores", ["qualification_id"], name: "index_candidate_course_scores_on_qualification_id", using: :btree

  create_table "candidate_experiences", force: :cascade do |t|
    t.string   "name",         limit: 20,    null: false
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description",  limit: 65535
    t.string   "shift_type",   limit: 255
    t.integer  "candidate_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "candidate_experiences", ["candidate_id"], name: "index_candidate_experiences_on_candidate_id", using: :btree

  create_table "candidate_links", force: :cascade do |t|
    t.string   "link_type",    limit: 50,    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "candidate_id", limit: 4
    t.text     "url",          limit: 65535, null: false
  end

  add_index "candidate_links", ["candidate_id"], name: "index_candidate_links_on_candidate_id", using: :btree

  create_table "candidate_projects", force: :cascade do |t|
    t.string   "title",        limit: 50,    null: false
    t.string   "domain",       limit: 50
    t.date     "start_date"
    t.date     "end_date",                   null: false
    t.string   "position",     limit: 35,    null: false
    t.string   "organisation", limit: 35,    null: false
    t.text     "description",  limit: 65535, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "candidate_projects", ["candidate_id"], name: "index_candidate_projects_on_candidate_id", using: :btree

  create_table "candidate_references", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.string   "email",        limit: 255
    t.string   "contact",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "candidate_references", ["candidate_id"], name: "index_candidate_references_on_candidate_id", using: :btree

  create_table "candidate_test_scores", force: :cascade do |t|
    t.integer  "candidate_id", limit: 4,  null: false
    t.integer  "test_id",      limit: 4,  null: false
    t.float    "score",        limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "candidate_test_scores", ["candidate_id"], name: "index_candidate_test_scores_on_candidate_id", using: :btree
  add_index "candidate_test_scores", ["test_id"], name: "index_candidate_test_scores_on_test_id", using: :btree

  create_table "candidates", force: :cascade do |t|
    t.string   "first_name",     limit: 20,                   null: false
    t.string   "last_name",      limit: 25,                   null: false
    t.date     "dob",                                         null: false
    t.string   "gender",         limit: 255,                  null: false
    t.string   "marital_status", limit: 255
    t.boolean  "status",                       default: true
    t.text     "languages",      limit: 65535
    t.text     "summary",        limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "phone",          limit: 15
    t.text     "interests",      limit: 65535
    t.integer  "user_id",        limit: 4
  end

  add_index "candidates", ["user_id"], name: "index_candidates_on_user_id", using: :btree

  create_table "candidates_job_opportunities", id: false, force: :cascade do |t|
    t.integer "candidate_id",       limit: 4, null: false
    t.integer "job_opportunity_id", limit: 4, null: false
  end

  add_index "candidates_job_opportunities", ["candidate_id", "job_opportunity_id"], name: "index_candidate_jo", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",                limit: 255, null: false
    t.string   "company_type",        limit: 255, null: false
    t.string   "url",                 limit: 255, null: false
    t.string   "tagline",             limit: 255
    t.string   "phone",               limit: 255, null: false
    t.integer  "number_of_employees", limit: 4
    t.string   "description",         limit: 255, null: false
    t.string   "logo",                limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_id",             limit: 4
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "company_events", force: :cascade do |t|
    t.string   "event_type",                 limit: 255, null: false
    t.string   "organiser",                  limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "company_job_opportunity_id", limit: 4
    t.datetime "date_time",                              null: false
    t.integer  "duration",                   limit: 4,   null: false
  end

  add_index "company_events", ["company_job_opportunity_id"], name: "index_company_events_on_company_job_opportunity_id", using: :btree

  create_table "company_job_opportunities", force: :cascade do |t|
    t.string   "title",               limit: 255,                         null: false
    t.string   "shift",               limit: 255,                         null: false
    t.text     "description",         limit: 65535,                       null: false
    t.integer  "number_of_positions", limit: 4,                           null: false
    t.string   "status",              limit: 255,   default: "available"
    t.string   "ctc",                 limit: 255
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "company_id",          limit: 4
    t.integer  "experience",          limit: 4
  end

  add_index "company_job_opportunities", ["company_id"], name: "index_company_job_opportunities_on_company_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "city",            limit: 255, null: false
    t.string   "street_name",     limit: 255, null: false
    t.string   "street_address",  limit: 255, null: false
    t.string   "building_name",   limit: 255, null: false
    t.string   "building_number", limit: 255, null: false
    t.string   "zipcode",         limit: 255, null: false
    t.string   "state",           limit: 255, null: false
    t.string   "country",         limit: 255, null: false
    t.string   "latitude",        limit: 255
    t.string   "longitude",       limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "locatable_id",    limit: 4
    t.string   "locatable_type",  limit: 255
  end

  add_index "locations", ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id", using: :btree

  create_table "qualification_assignments", force: :cascade do |t|
    t.integer "qualification_id", limit: 4
    t.integer "qualifiable_id",   limit: 4
    t.string  "qualifiable_type", limit: 255
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "course",     limit: 255, null: false
    t.string   "domain",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "text",         limit: 65535
    t.integer  "rating",       limit: 4
    t.integer  "candidate_id", limit: 4
    t.integer  "company_id",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "reviews", ["candidate_id"], name: "index_reviews_on_candidate_id", using: :btree
  add_index "reviews", ["company_id"], name: "index_reviews_on_company_id", using: :btree

  create_table "skill_assignments", force: :cascade do |t|
    t.integer  "skill_id",       limit: 4
    t.integer  "skillable_id",   limit: 4
    t.string   "skillable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 15
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name",       limit: 20,    null: false
    t.text     "url",        limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "max_score",  limit: 24
  end

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

  add_foreign_key "admins", "users"
  add_foreign_key "candidate_achievements", "candidates"
  add_foreign_key "candidate_course_scores", "candidates"
  add_foreign_key "candidate_course_scores", "qualifications"
  add_foreign_key "candidate_experiences", "candidates"
  add_foreign_key "candidate_links", "candidates"
  add_foreign_key "candidate_projects", "candidates"
  add_foreign_key "candidate_references", "candidates"
  add_foreign_key "candidates", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "company_events", "company_job_opportunities"
  add_foreign_key "company_job_opportunities", "companies"
  add_foreign_key "reviews", "candidates"
  add_foreign_key "reviews", "companies"
end
