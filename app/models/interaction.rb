class Interaction < ApplicationRecord
  belongs_to :classroom
  belongs_to :topic
  belongs_to :course
  belongs_to :teacher
  has_one :interaction_type
end
