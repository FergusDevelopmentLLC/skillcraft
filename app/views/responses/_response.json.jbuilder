json.extract! response, :id, :interaction_id, :student_id, :type, :content, :score, :letter_grade, :created_at, :updated_at
json.url response_url(response, format: :json)