class Response < ApplicationRecord
  belongs_to :interaction
  belongs_to :user

  #scope :completed_assignment, -> { where(type == 'CompletedAssignment') }
end
