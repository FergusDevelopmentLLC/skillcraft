class Response < ApplicationRecord
  belongs_to :interaction
  belongs_to :user

  def friendly_name
    type == "CompletedAssignment" ? "completed assignment" : type.downcase
  end
end
