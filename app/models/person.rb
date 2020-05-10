class Person < ApplicationRecord
  has_many :responses, dependent: :destroy #student has responses
  has_many :interactions, dependent: :destroy

  has_many :course_people, dependent: :destroy
  has_many :courses, through: :course_people, dependent: :destroy
  belongs_to :avatar

  validates :user_name, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :type, inclusion: { in: ["Student", "Teacher"], message: "must be Teacher or Student" }

  def self.teacher_student
    @people = []
    teacher = Teacher.new
    teacher.type = "Teacher"
    teacher.save
    @people.push(teacher)
    student = Student.new
    student.type = "Student"
    student.save
    @people.push(student)
    @people
  end

end
