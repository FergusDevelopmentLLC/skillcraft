class Student < Person
    has_many :interactions
    has_many :course_people, :through => :course_people
    has_many :courses, :through => :course_people
    has_many :responses
end