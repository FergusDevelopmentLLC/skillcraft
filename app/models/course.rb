class Course < ApplicationRecord
  
  has_many :courses_users
  # https://stackoverflow.com/questions/13749558/use-through-option-on-a-belongs-to-activerecord-association
  # https://gorails.com/forum/a-has_one-through-association-issue
  # https://stackoverflow.com/questions/4115554/rails-has-many-through-is-it-possible-to-have-a-conditions-in-the-through-tab
  # TODO: how can i make this has_one?
  has_many :teachers, -> { where type: "Teacher" }, through: :courses_users, source: :user
  has_many :students, -> { where type: "Student" }, through: :courses_users, source: :user
  
  has_many :interactions
  has_many :responses, through: :interactions
  has_many :announcements, -> { where type: "Announcement" }, source: :interactions
  has_many :assignments, -> { where type: "Assignment" }, source: :interactions

  has_many :questions, -> { where type: "Question" }, through: :announcements, source: :responses
  has_many :completed_assignments, -> { where type: "CompletedAssignment" }, through: :assignments, source: :responses
  
  has_many :comments, dependent: :destroy
  has_many :commenting_users, through: :comments, source: :user
  accepts_nested_attributes_for :comments

  scope :featured, -> { where(featured: true) }
  scope :free, -> { where(tuition_cost: 0) }
  
  validates :name, presence: true
  validates :tuition_cost, presence: true, numericality: { only_integer: true }
  validates :code, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { minimum: 4, maximum: 4 }
  
  validates :short_desc, presence: true
  validates :long_desc, presence: true
  
  def comments_attributes=(comment_attributes)
    comment_attributes.values.each do |comment_attribute| 
      comment = Comment.find_or_create_by(id: comment_attribute[:id])
      # TODO: better way?
      # the example is:
      # comment = Comment.find_or_create_by(course_attribute)
      # but this will not match if the content is updated
      comment.content = comment_attribute[:content]
      comments << comment
    end	  
  end
  
end