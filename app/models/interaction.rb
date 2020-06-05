class Interaction < ApplicationRecord
  
  belongs_to :course
  belongs_to :user
  
  has_many :responses
  has_many :questions, -> { where type: "Question" }, source: :response
  has_many :completed_assignments, -> { where type: "Question" }, source: :response

  def responses_type
    type == "Announcement" ? "Questions" : "Completed Assignments"
  end

  def activity_date
    type == "Assignment" ? Time.parse(due_date.to_s).getutc : Time.parse(created_at.to_s).getutc
  end

end
