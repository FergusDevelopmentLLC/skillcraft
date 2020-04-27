class Teacher < Person
    has_many :interactions, through: :responses
    has_many :course_people
    has_many :courses, through: :course_people
end
