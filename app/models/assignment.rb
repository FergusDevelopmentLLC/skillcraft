class Assignment < Interaction

  def completed_assignments
    responses.find_all { |response| response.type == 'CompletedAssignment' }
  end

  def turned_in?(student)
    !!CompletedAssignment.all.find_by(interaction: self, user: student)
  end

end