class CoursePerson < ApplicationRecord
    has_many :people, class_name: "Person", foreign_key: "person_id"
    has_many :courses, class_name: "Course", foreign_key: "course_id"
end
