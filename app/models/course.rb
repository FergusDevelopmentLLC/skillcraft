class Course < ApplicationRecord
  has_many :interactions, dependent: :destroy
  has_many :course_people
  has_many :students, through: :course_person
  has_many :teachers, through: :course_person
end
