json.extract! game_profile, :id, :points, :money, :level, :created_at, :updated_at
json.url game_profile_url(game_profile, format: :json)
