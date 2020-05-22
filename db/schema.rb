# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_16_175753) do

  create_table "avatars", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.string "user_feedback"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_course_users_on_course_id"
    t.index ["user_id"], name: "index_course_users_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "featured"
    t.string "short_desc"
    t.string "long_desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "user_id", null: false
    t.string "type"
    t.string "title"
    t.date "due_date"
    t.boolean "graded"
    t.integer "points"
    t.string "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_interactions_on_course_id"
    t.index ["user_id"], name: "index_interactions_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "interaction_id", null: false
    t.integer "user_id", null: false
    t.string "title"
    t.string "type"
    t.string "content"
    t.integer "score"
    t.string "letter_grade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interaction_id"], name: "index_responses_on_interaction_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "user_name"
    t.integer "avatar_id"
    t.string "type"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
  end

  add_foreign_key "interactions", "courses"
  add_foreign_key "interactions", "users"
  add_foreign_key "responses", "interactions"
  add_foreign_key "responses", "users"
end
