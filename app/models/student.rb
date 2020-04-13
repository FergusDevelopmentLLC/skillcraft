class Student < Person
    has_many :course_people, class_name: "course_people", foreign_key: "person_id", dependent: :destroy
    has_many :courses, through: :course_people, source: :course_student_id
end
