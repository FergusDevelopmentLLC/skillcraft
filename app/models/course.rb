class Course < ApplicationRecord
  has_many :students, through: :course_person
  has_many :teachers, through: :course_person
end
