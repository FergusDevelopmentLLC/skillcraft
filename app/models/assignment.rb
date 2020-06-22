class Assignment < Interaction
  def turned_in?(student)
  
    #TODO, this is not good, use CompletedAssignment.where

    !!CompletedAssignment.all.find_by(interaction: self, user: student)
  end
end