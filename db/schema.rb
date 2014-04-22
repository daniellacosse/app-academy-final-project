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

ActiveRecord::Schema.define(version: 20140422145452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deviations", force: true do |t|
    t.string   "media_file_name"
    t.string   "media_content_type"
    t.integer  "media_file_size"
    t.datetime "media_updated_at"
    t.string   "title",              null: false
    t.text     "description"
    t.integer  "user_id",            null: false
    t.boolean  "is_mature",          null: false
    t.boolean  "is_commentable",     null: false
    t.boolean  "is_shareable",       null: false
    t.boolean  "is_likeable",        null: false
    t.boolean  "is_DRM",             null: false
    t.boolean  "is_CC",              null: false
    t.boolean  "can_remix",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deviations", ["user_id"], name: "index_deviations_on_user_id", using: :btree

  create_table "journals", force: true do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "journals", ["user_id"], name: "index_journals_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",            null: false
    t.string   "email",               null: false
    t.string   "password_digest",     null: false
    t.string   "token",               null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "country",             null: false
    t.date     "date_of_birth",       null: false
    t.text     "biography"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
