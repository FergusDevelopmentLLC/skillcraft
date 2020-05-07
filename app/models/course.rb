class Course < ApplicationRecord

    has_many :interactions, dependent: :destroy
    
    has_many :course_people
    has_many :people, :through => :course_people

    def students
        returnVal = self.people.find_all { |person| person.type == "Student" } 
    end

    def teachers
        self.people.find_all { |person| person.type == "Teacher" } 
    end
end
