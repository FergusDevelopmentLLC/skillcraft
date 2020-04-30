class Person < ApplicationRecord
    has_many :interactions
    has_many :responses, dependent: :destroy
    #has_many :interactions, through: :responses
end
