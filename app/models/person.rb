class Person < ApplicationRecord

    has_many :interactions, dependent: :destroy
    
    has_many :responses, dependent: :destroy

    has_many :course_people
    has_many :courses, through: :course_people, dependent: :destroy 
    
end
