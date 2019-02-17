class Answer < ApplicationRecord
	has_many :answer_questions, dependent: :destroy
	has_many :questions, :through => :answer_questions
	has_many :category_answers
	has_many :categories, :through => :category_answers
end
