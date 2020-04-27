json.extract! announcement, :id, :course_id, :person_id, :type, :title, :start_date, :end_date, :posted_date, :due_date, :graded, :points, :instructions, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
