class Course < ApplicationRecord
  
  has_many :interactions, dependent: :destroy
  
  # has_many :course_users
  # has_many :users, through: :course_users, as: :users

  # has_many :course_users
  # has_many :users, through: :course_users, as: :teachers

  has_and_belongs_to_many :users

  # has_many :comments
  # has_many :users, through: :comments, as: :commenting_users

  # accepts_nested_attributes_for :comment

  #scope :search_by_name, -> (search_name){where("name = ?", search_name)}
  #scope :most_reviewed_city, -> { City.joins(:reviews).group("cities.id").order('COUNT(reviews.id) DESC').limit(1)}

  # validate :course_code
  def students
    users.find_all { |user| user.type == 'Student' }
  end

  def teachers
    users.find_all { |user| user.type == 'Teacher' }
  end
  
  def announcements
    interactions.find_all { |interaction| interaction.type == 'Announcement' }
  end

  def assignments
    interactions.find_all { |interaction| interaction.type == 'Assignment' }
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
