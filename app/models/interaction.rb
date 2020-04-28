class Interaction < ApplicationRecord
    belongs_to :course
    belongs_to :person
    has_many :responses, dependent: :destroy
end
