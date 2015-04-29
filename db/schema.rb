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

ActiveRecord::Schema.define(version: 20150428215502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: true do |t|
    t.text     "note_text"
    t.integer  "author_id"
    t.integer  "visit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "students", force: true do |t|
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "gender"
    t.integer  "visit_count"
    t.integer  "current_reason_num"
    t.integer  "current_visit_id"
    t.string   "image_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students_teachers", force: true do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visits", force: true do |t|
    t.integer  "student_id"
    t.datetime "date_time"
    t.datetime "end_time"
    t.string   "reason_num"
    t.string   "task_choice"
    t.text     "task_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
