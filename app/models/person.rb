class Person < ApplicationRecord
    has_many :course_people, dependent: :destroy
    has_many :courses, through: :course_people
end