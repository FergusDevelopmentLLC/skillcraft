class Course < ApplicationRecord

    has_many :interactions, dependent: :destroy

    has_many :course_people, dependent: :destroy
    # has_many :people, through: :course_people, dependent: :destroy

end
