class Student < Person
    has_secure_password
    #has_many :responses, dependent: :destroy #student has responses
    
    #has_many :course_people, dependent: :destroy
    #has_many :courses, through: :course_people, dependent: :destroy
    #has_many :course_people, :foreign_key => "player_id", :class_name => "Course"   
end
