class Avatar < ApplicationRecord
  has_one :user

  def self.unused_avatar

    #TODO, this is not good, don't use Avatar.all
    
    Avatar.all.without(User.all.map(&:avatar)).sample
  end

end
