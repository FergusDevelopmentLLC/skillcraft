class Assignment < Interaction

  def completed_assignments
    responses.find_all { |response| response.type == 'CompletedAssignment' }
  end

end