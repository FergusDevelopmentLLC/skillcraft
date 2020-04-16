json.extract! student, :id, :user_name, :type, :password_digest, :first_name, :last_name, :email, :created_at, :updated_at
json.url student_url(student, format: :json)
