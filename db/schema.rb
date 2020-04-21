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

ActiveRecord::Schema.define(version: 2020_04_20_205544) do

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_people", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_course_people_on_classroom_id"
    t.index ["person_id"], name: "index_course_people_on_person_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_courses_on_classroom_id"
  end

  create_table "interaction_types", force: :cascade do |t|
    t.integer "interaction_id", null: false
    t.string "name"
    t.index ["interaction_id"], name: "index_interaction_types_on_interaction_id"
  end

  create_table "interactions", force: :cascade do |t|
    t.integer "classroom_id", null: false
    t.integer "topic_id", null: false
    t.integer "course_id", null: false
    t.integer "teacher_id", null: false
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.date "posted_date"
    t.date "due_date"
    t.boolean "graded"
    t.integer "points"
    t.string "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_interactions_on_classroom_id"
    t.index ["course_id"], name: "index_interactions_on_course_id"
    t.index ["teacher_id"], name: "index_interactions_on_teacher_id"
    t.index ["topic_id"], name: "index_interactions_on_topic_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "user_name"
    t.string "type"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "interaction_id", null: false
    t.integer "student_id", null: false
    t.string "type"
    t.string "content"
    t.integer "score"
    t.string "letter_grade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interaction_id"], name: "index_responses_on_interaction_id"
    t.index ["student_id"], name: "index_responses_on_student_id"
  end

  create_table "topics", force: :cascade do |t|
    t.integer "course_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_topics_on_course_id"
  end

  add_foreign_key "course_people", "classrooms"
  add_foreign_key "course_people", "people"
  add_foreign_key "courses", "classrooms"
  add_foreign_key "interaction_types", "interactions"
  add_foreign_key "interactions", "classrooms"
  add_foreign_key "interactions", "courses"
  add_foreign_key "interactions", "teachers"
  add_foreign_key "interactions", "topics"
  add_foreign_key "responses", "interactions"
  add_foreign_key "responses", "students"
  add_foreign_key "topics", "courses"
end
