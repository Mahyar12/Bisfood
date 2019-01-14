json.extract! table_game, :id, :show_chars, :words, :created_at, :updated_at
json.url table_game_url(table_game, format: :json)
