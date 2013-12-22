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

ActiveRecord::Schema.define(version: 20131202140809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "candidate_counting_voice_papers", force: true do |t|
    t.integer  "poll_id"
    t.integer  "candidate_id"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidates", force: true do |t|
    t.integer  "election_year"
    t.integer  "sequence_number"
    t.string   "name_kp"
    t.string   "name_wkp"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidates_round_elections", id: false, force: true do |t|
    t.integer "candidate_id"
    t.integer "round_election_id"
  end

  create_table "counting_ballot_papers", force: true do |t|
    t.integer  "poll_id"
    t.integer  "male_voters"
    t.integer  "female_voters"
    t.integer  "spoiled_ballot_papers"
    t.integer  "unauthorized"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "out_side_polls", force: true do |t|
    t.integer  "poll_id"
    t.integer  "current_poll_id"
    t.integer  "male_voters"
    t.integer  "female_voters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls", force: true do |t|
    t.integer  "number"
    t.string   "address"
    t.integer  "admin_user_id"
    t.integer  "sub_district_id"
    t.integer  "village_id"
    t.integer  "male_voters"
    t.integer  "female_voters"
    t.integer  "backup_ballot_papers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "round_elections", force: true do |t|
    t.date     "date"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_districts", force: true do |t|
    t.string   "code"
    t.string   "address"
    t.string   "name"
    t.integer  "admin_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "villages", force: true do |t|
    t.string   "code"
    t.string   "address"
    t.string   "name"
    t.integer  "admin_user_id"
    t.integer  "sub_district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rt"
    t.string   "rw"
  end

end
