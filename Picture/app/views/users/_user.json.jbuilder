json.extract! user, :id, :username, :password_digest, :name, :avatar_filename, :gender, :created_at, :updated_at, :email
json.url user_url(user, format: :json)
