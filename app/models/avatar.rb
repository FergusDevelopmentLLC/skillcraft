class Avatar < ApplicationRecord
  has_one :person

  def self.unused_avatar
    Avatar.all.without(Person.all.map(&:avatar)).sample
  end
end
