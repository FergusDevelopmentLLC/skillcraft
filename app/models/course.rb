class Course < ApplicationRecord
    belongs_to :classroom
    has_many :interactions
    has_many :topics
    has_many :course_people
    has_many :people, through: :course_people
end
