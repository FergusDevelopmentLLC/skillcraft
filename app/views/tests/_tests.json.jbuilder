json.extract! test, :id, :classroom_id, :topic_id, :course_id, :teacher_id, :type, :title, :start_date, :end_date, :posted_date, :due_date, :graded, :points, :instructions, :created_at, :updated_at
json.url test_url(test, format: :json)
