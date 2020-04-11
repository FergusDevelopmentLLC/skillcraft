class CourseTeacher < ApplicationRecord
    has_many :teachers
    has_many :courses
end
