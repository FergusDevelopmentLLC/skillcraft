class User < ApplicationRecord
  has_many :responses, dependent: :destroy
  has_many :interactions, dependent: :destroy

  has_many :course_users, dependent: :destroy
  has_many :courses, through: :course_users, dependent: :destroy
  belongs_to :avatar

  validates :user_name, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: false, uniqueness: true
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

    user.type = if is_student
                  'Student'
                else
                  'Teacher'
                end
    
    user.avatar = Avatar.unused_avatar
    user.password_digest = SecureRandom.urlsafe_base64
    user.save
    user
  end
end
