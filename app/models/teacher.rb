class Teacher < Person
    has_secure_password  
    has_many :interactions, dependent: :destroy #teacher has interactions

    has_many :course_people, dependent: :destroy
    has_many :courses, through: :course_people, dependent: :destroy
end
