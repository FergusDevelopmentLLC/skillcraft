class Assignment < Interaction

  scope :graded, -> { where(graded: true) }

  scope :for_course, ->(course) { where("course_id == ?", course.id) }

  def completed_assignments
    responses.find_all { |response| response.type == 'CompletedAssignment' }
  end

  def turned_in?(student)
    !!CompletedAssignment.all.find_by(interaction: self, user: student)
  end

end