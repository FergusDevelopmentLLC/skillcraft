class Course < ApplicationRecord

    has_many :interactions, dependent: :destroy
    
    has_many :course_people
    has_many :people, :through => :course_people

    def students
        self.people.find_all { |person| person.type == "Student" } 
    end

    def teachers
        self.people.find_all { |person| person.type == "Teacher" } 
    end

    # def self.assign_to_course(student, course)
    #     match = Course.find_by(:code => course.code)
    #     if match
    #         cp = CoursePerson.new
    #         cp.course = course
    #         cp.person = student
    #         cp.save
    #     end
    # end

end
