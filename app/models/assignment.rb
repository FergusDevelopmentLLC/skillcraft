class Assignment < Interaction

  def completed_assignments
    responses.find_all { |response| response.type == 'CompletedAssignment' }
  end

  def turned_in?(student)
    if type == "Announcement"
      true
    else
      !!CompletedAssignment.all.find_by(interaction: self, user: student)
    end
  end

end