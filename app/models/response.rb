class Response < ApplicationRecord
    belongs_to :interaction
    has_many :students
end
