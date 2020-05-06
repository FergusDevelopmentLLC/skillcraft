class CoursePerson < ApplicationRecord
    belongs_to :person
    belongs_to :course

    # belongs_to :student, :foreign_key => :student_id, :primary_key => :person_id
    # belongs_to :teacher, :foreign_key => :teacher_id, :primary_key => :person_id
    # belongs_to :course, :foreign_key => :course_id, :primary_key => :course_id
end
