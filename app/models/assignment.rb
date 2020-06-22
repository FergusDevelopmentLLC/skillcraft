class Assignment < Interaction
  def turned_in?(student)
    !CompletedAssignment.where(interaction: self, user: student).empty?
  end
end