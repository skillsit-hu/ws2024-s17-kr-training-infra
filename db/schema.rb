# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_28_104810) do
  create_table "admins", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "description"
    t.string "state", default: "draft"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "lessons", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "room_id", null: false
    t.date "date"
    t.time "from"
    t.time "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["room_id"], name: "index_lessons_on_room_id"
  end

  create_table "room_unavailable_times", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.date "date"
    t.time "from"
    t.time "to"
    t.boolean "fullday", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_unavailable_times_on_room_id"
  end

  create_table "rooms", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courses", "users"
  add_foreign_key "lessons", "courses"
  add_foreign_key "lessons", "rooms"
  add_foreign_key "room_unavailable_times", "rooms"
end
