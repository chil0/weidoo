json.extract! chirp, :id, :user_id, :chirp, :photo, :file_name, :file_type, :chirped_at, :created_at, :updated_at
json.url chirp_url(chirp, format: :json)
