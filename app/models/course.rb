class Course < ApplicationRecord
    belongs_to :classroom
    has_many :interactions
    has_many :topics
end
