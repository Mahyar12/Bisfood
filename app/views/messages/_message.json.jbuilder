json.extract! message, :id, :mtext, :user_id, :created_at, :updated_at
json.url message_url(message, format: :json)
