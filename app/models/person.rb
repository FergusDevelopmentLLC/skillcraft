class Person < ApplicationRecord
    has_many :interactions
    has_many :responses
end
