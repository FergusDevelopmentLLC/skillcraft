class User < ApplicationRecord
  has_many :responses, dependent: :destroy
  has_many :interactions, dependent: :destroy

  has_many :course_users, dependent: :destroy
  has_many :courses, through: :course_users, dependent: :destroy
  belongs_to :avatar

  validates :user_name, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :type, inclusion: { in: ["Student", "Teacher"], message: "must be Teacher or Student" }

  def self.teacher_student
    @users = []
    teacher = Teacher.new
    teacher.type = "Teacher"
    teacher.save
    @users.push(teacher)
    student = Student.new
    student.type = "Student"
    student.save
    @users.push(student)
    @users
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end
