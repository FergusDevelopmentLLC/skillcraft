class Course < ApplicationRecord
  has_many :interactions, dependent: :destroy
  has_many :course_people
  has_many :people, through: :course_people

  # validate :course_code

  def students
    people.find_all { |person| person.type == 'Student' }
  end

  def teachers
    people.find_all { |person| person.type == 'Teacher' }
  end

  # def course_code
  #   binding.pry
  #   errors.add(:teacher, 'is not active')
  # end
end
