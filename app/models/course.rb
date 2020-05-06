class Course < ApplicationRecord

    has_many :interactions, dependent: :destroy
    
    has_many :course_people
    has_many :people, :through => :course_people, as: :students
end
