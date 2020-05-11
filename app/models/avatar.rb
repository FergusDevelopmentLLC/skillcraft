class Avatar < ApplicationRecord
  has_one :user

  def self.unused_avatar
    Avatar.all.without(User.all.map(&:avatar)).sample
  end
end
