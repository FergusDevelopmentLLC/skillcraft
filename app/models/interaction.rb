class Interaction < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :responses, dependent: :destroy

  def responses_type
    responses.first.type.pluralize.split(/(?=[A-Z])/).join(' ') unless responses.empty?
  end

end
