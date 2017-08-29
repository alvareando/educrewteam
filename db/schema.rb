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

ActiveRecord::Schema.define(version: 20170829143402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "chatrooms", force: :cascade do |t|
    t.integer  "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_chatrooms_on_session_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "chatrooms_id"
    t.string   "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["chatrooms_id"], name: "index_messages_on_chatrooms_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  end

  create_table "session_participations", force: :cascade do |t|
    t.integer  "students_id"
    t.integer  "sessions_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["sessions_id"], name: "index_session_participations_on_sessions_id", using: :btree
    t.index ["students_id"], name: "index_session_participations_on_students_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "tutor_id"
    t.date     "date"
    t.time     "time"
    t.integer  "estimated_duration"
    t.string   "subject"
    t.string   "university"
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.boolean  "suggestion",         default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["tutor_id"], name: "index_sessions_on_tutor_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "tutor",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "chatrooms", "sessions"
  add_foreign_key "messages", "chatrooms", column: "chatrooms_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "session_participations", "sessions", column: "sessions_id"
  add_foreign_key "session_participations", "users", column: "students_id"
  add_foreign_key "sessions", "users", column: "tutor_id"
end
