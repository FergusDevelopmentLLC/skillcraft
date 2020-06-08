class Course < ApplicationRecord
  
  # https://stackoverflow.com/questions/13749558/use-through-option-on-a-belongs-to-activerecord-association
  # https://gorails.com/forum/a-has_one-through-association-issue
  # https://stackoverflow.com/questions/4115554/rails-has-many-through-is-it-possible-to-have-a-conditions-in-the-through-tab
  # TODO: how can i make this has_one?
  has_many :courses_users
  has_many :teachers, -> { where type: "Teacher" }, through: :courses_users, source: :user
  has_many :students, -> { where type: "Student" }, through: :courses_users, source: :user
  
  has_many :interactions
  has_many :announcements, -> { where type: "Announcement" }, source: :interaction
  has_many :assignments, -> { where type: "Assignment" }, source: :interaction
  
  #TODO: this isn't working correctly, replace methods below
  #has_many :questions, through: :announcements, source: :course
  #has_many :completed_assignments, through: :assignments, source: :course
 
  has_many :comments, dependent: :destroy
  has_many :commenting_users, through: :comments, source: :user
  accepts_nested_attributes_for :comments

  scope :featured, -> { where(featured: true) }
  scope :free, -> { where(tuition_cost: 0) }
  
  validates :name, presence: true
  validates :tuition_cost, presence: true, numericality: { only_integer: true }
  validates :code, presence: true, uniqueness: true, numericality: { only_integer: true }, length: { minimum: 4, maximum: 4 }
  
  validates :image_url, presence: true
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

  def questions
    ret_questions = []
    announcements = interactions.find_all { |interaction| interaction.type == 'Announcement' }
    unless announcements.empty?
      announcements.each do |announcement|
        next if announcement.responses.empty?
        
        announcement.responses.each do |response|
          ret_questions << response if response.type == "Question"
        end
      end
    end
    ret_questions
  end

  def completed_assignments
    ret = []
    assignments = interactions.find_all { |interaction| interaction.type == 'Assignment' }
    unless assignments.empty?
      assignments.each do |assignment|
        next if assignment.responses.empty?
        
        assignment.responses.each do |response|
          ret << response if response.type == "CompletedAssignment"
        end
      end
    end
    ret
  end
  
end