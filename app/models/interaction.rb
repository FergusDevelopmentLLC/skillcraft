class Interaction < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :responses, dependent: :destroy

  def responses_type
    responses.first.type.pluralize.split(/(?=[A-Z])/).join(' ') unless responses.empty?
  end

  def activity_date
    type == "Assignment" ? Time.parse(due_date.to_s).getutc : Time.parse(created_at.to_s).getutc
  end

  def turned_in?(student)
    if type == "Announcement"
      true
    else
      !!CompletedAssignment.all.find_by(interaction: self, user: student)
    end
  end
  
end
