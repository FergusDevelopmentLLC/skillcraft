class Assignment < Interaction
  #scope :graded, -> { where(graded: true) }
  #scope :for_course, ->(course) { where("course_id == ?", course.id) }

  scope :graded, -> { where(graded: true) }
  scope :due, -> { where("due_date <= ?", DateTime.now) }

  def turned_in?(student)
    !!CompletedAssignment.all.find_by(interaction: self, user: student)
  end

end