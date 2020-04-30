class Student < Person
    has_many :course_people
    has_many :courses, through: :course_people
end
