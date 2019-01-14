json.extract! question, :id, :content, :qtype_id, :answer_question_id, :category_question_id, :created_at, :updated_at
json.url question_url(question, format: :json)
