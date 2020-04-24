class Interaction < ApplicationRecord
  belongs_to :classroom
  belongs_to :topic
  belongs_to :course
  belongs_to :person
end
