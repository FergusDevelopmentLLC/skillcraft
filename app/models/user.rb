class User < ApplicationRecord
  has_secure_password
  
  belongs_to :avatar

  has_and_belongs_to_many :courses

  has_many :responses, dependent: :destroy
  has_many :completed_assignments, -> { where type: "CompletedAssignment" }, source: :response
  has_many :questions, -> { where type: "Question" }, source: :response

  has_many :interactions, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  has_many :courses_commented_on, through: :comments, source: :course

  validates :user_name, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :type, inclusion: { in: ["Student", "Teacher"], message: "must be teacher or student" }

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

  def self.create_with_omniauth_twitter(auth_params, is_student)
    
    user = User.new

    if auth_params['info']
      user.user_name = auth_params['info']['nickname'] || ""
      user.first_name = (auth_params['info']['name'] || "").split(" ").first
      user.last_name = (auth_params['info']['name'] || "").split(" ").second
      user.email = auth_params['info']['email'] || ""
    end

    user.provider = auth_params['provider']
    user.uid = auth_params['uid']
    user.type = is_student ? 'Student' : 'Teacher'
    user.avatar = Avatar.unused_avatar
    user.password_digest = SecureRandom.urlsafe_base64
    
    user.save
    
    user
  end
end
