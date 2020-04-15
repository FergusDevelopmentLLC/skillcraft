class CoursePerson < ApplicationRecord
    has_many :people
    has_many :courses
end
