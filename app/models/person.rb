class Person < ApplicationRecord
    has_many :course_people, class_name: "course_people", foreign_key: "course_people_id"
    has_many :courses, through: :course_people, source: :person
end