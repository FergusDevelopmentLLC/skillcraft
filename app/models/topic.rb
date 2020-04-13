class Topic < ApplicationRecord
    has_many :interactions, foreign_key: "topic_id"
end
