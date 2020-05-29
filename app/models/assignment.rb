class Assignment < Interaction
  def turned_in?(student)
    !!CompletedAssignment.all.find_by(interaction: self, user: student)
  end
end