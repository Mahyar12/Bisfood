json.extract! user_cup, :id, :user_id, :cup_id, :cup_count, :created_at, :updated_at
json.url user_cup_url(user_cup, format: :json)
