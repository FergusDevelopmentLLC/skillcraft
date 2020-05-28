class Course < ApplicationRecord
  
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments

  has_and_belongs_to_many :users

  has_many :interactions
  has_many :responses, through: :interactions
  
  validate :code
  
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

  # def questions
  #   ret_questions = []
  #   announcements = interactions.find_all { |interaction| interaction.type == 'Announcement' }
  #   unless announcements.empty?
  #     announcements.each do |announcement|
  #       next if announcement.responses.empty?
        
  #       announcement.responses.each do |response|
  #         ret_questions << response if response.type == "Question"
  #       end
  #     end
  #   end
  #   ret_questions
  # end

  # def completed_assignments
  #   ret = []
  #   assignments = interactions.find_all { |interaction| interaction.type == 'Assignment' }
  #   unless assignments.empty?
  #     assignments.each do |assignment|
  #       next if assignment.responses.empty?
        
  #       assignment.responses.each do |response|
  #         ret << response if response.type == "CompletedAssignment"
  #       end
  #     end
  #   end
  #   ret
  # end

end
