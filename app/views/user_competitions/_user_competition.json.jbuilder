json.extract! user_competition, :id, :user_id, :competition_id, :status, :points, :created_at, :updated_at
json.url user_competition_url(user_competition, format: :json)
