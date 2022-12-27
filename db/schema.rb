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

ActiveRecord::Schema[7.0].define(version: 2022_12_27_081440) do
  create_table "council_members", force: :cascade do |t|
    t.integer "student_id"
    t.string "rank", null: false
    t.integer "floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_council_members_on_student_id", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.integer "council_member_id"
    t.string "title"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["council_member_id"], name: "index_messages_on_council_member_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "council_member_id"
    t.string "title", null: false
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["council_member_id"], name: "index_posts_on_council_member_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "student_id"
    t.integer "staff_id"
    t.integer "floor", null: false
    t.string "location", null: false
    t.string "problem", null: false
    t.string "status", default: "Не рассмотрено", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_requests_on_staff_id"
    t.index ["student_id"], name: "index_requests_on_student_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "user_id"
    t.string "rank", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_staffs_on_user_id", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "password_digest", null: false
    t.string "name", null: false
    t.string "surname", null: false
    t.string "second_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  add_foreign_key "council_members", "students"
  add_foreign_key "messages", "council_members"
  add_foreign_key "posts", "council_members"
  add_foreign_key "requests", "staffs"
  add_foreign_key "requests", "students"
  add_foreign_key "staffs", "users"
  add_foreign_key "students", "users"
end
