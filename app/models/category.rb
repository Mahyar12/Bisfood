class Category < ApplicationRecord
	has_many :category_answers
	has_many :answers, through: :category_answers
	has_many :category_questions
	has_many :questions, through: :category_questions
end
