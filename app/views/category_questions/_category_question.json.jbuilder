json.extract! category_question, :id, :category_id, :question_id, :created_at, :updated_at
json.url category_question_url(category_question, format: :json)
