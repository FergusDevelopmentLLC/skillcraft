class Classroom < ApplicationRecord
    has_many :courses
    has_many :topics
end
