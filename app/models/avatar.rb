class Avatar < ApplicationRecord
  has_one :user

  # TODO: do this better?
  def self.unused_avatar
    Avatar.all.without(User.all.map(&:avatar)).sample
  end

end
