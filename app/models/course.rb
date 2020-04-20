class Course < ApplicationRecord
  belongs_to :classroom
  has_many :topics
end
