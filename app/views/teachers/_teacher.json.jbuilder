json.extract! teacher, :id, :user_name, :type, :password_digest, :first_name, :last_name, :email, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
