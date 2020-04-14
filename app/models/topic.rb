class Topic < ApplicationRecord
    has_many :interactions, dependent: :destroy
end
