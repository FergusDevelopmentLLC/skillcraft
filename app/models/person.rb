class Person < ApplicationRecord
  #has_many :responses, dependent: :destroy #student has responses
  #has_many :interactions, dependent: :destroy

  has_many :course_people, dependent: :destroy
  has_many :courses, through: :course_people, dependent: :destroy

  #validates_associated :courses

  # belongs_to :avatar, class_name: "avatar", foreign_key: "avatar_id"

  belongs_to :avatar
end
