class Course < ApplicationRecord
    belongs_to :classroom, class_name: "Classroom", foreign_key: "classroom_id"
end
