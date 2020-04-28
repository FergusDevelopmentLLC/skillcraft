class Student < Person
    has_many :responses, dependent: :destroy
    has_many :interactions, through: :responses
    has_many :course_people
    has_many :courses, through: :course_people
end
