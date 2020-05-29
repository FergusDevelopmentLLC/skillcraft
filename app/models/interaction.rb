class Interaction < ApplicationRecord
  
  belongs_to :course
  belongs_to :user

  has_many :responses
  has_many :questions, through: :responses, source: :interaction
  has_many :completed_assignments, through: :responses, source: :interaction
  
  def responses_type
    type == "Announcement" ? "Questions" : "Completed Assignments"
  end

  def activity_date
    type == "Assignment" ? Time.parse(due_date.to_s).getutc : Time.parse(created_at.to_s).getutc
  end

end
