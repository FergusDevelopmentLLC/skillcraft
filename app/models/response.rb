class Response < ApplicationRecord
  belongs_to :interaction
  belongs_to :person
end
