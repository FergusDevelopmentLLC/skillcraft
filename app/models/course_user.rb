class CourseUser < ApplicationRecord
    belongs_to :user
    belongs_to :course

    # belongs_to :student, :foreign_key => :student_id, :primary_key => :user_id
    # belongs_to :teacher, :foreign_key => :teacher_id, :primary_key => :user_id
    # belongs_to :course, :foreign_key => :course_id, :primary_key => :course_id
end
