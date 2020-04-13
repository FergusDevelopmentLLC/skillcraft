class Interaction < ApplicationRecord
    belongs_to :topic, class_name: "topic", foreign_key: "topic_id"
end
