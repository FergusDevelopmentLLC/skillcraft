class Course < ApplicationRecord
  has_many :interactions, dependent: :destroy
  has_many :course_users
  has_many :users, through: :course_users

  # validate :course_code

  def students
    users.find_all { |user| user.type == 'Student' }
  end

  def teachers
    users.find_all { |user| user.type == 'Teacher' }
  end
  
end
