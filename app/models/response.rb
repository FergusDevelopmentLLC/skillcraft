class Response < ApplicationRecord
  belongs_to :interaction
  belongs_to :user

  def friendly_name
    type == "CompletedAssignment" ? "completed assignment" : type.downcase
  end

  def graded
    type == "CompletedAssignment" && (score || letter_grade)
  end

end
