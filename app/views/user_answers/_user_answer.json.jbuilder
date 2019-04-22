json.extract! user_answer, :id, :question_id, :user_id, :competition_id, :status, :created_at, :updated_at
json.url user_answer_url(user_answer, format: :json)
