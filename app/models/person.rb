class Person < ApplicationRecord
    
    #has_many :responses, dependent: :destroy #student has responses
    #has_many :interactions, dependent: :destroy

    has_many :course_people, dependent: :destroy
    has_many :courses, through: :course_people, dependent: :destroy
end