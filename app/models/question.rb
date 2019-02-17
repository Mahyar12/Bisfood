class Question < ApplicationRecord
	belongs_to :qtype
	has_many :category_questions, dependent: :destroy
	has_many :categories, :through => :category_questions
	has_many :answer_questions, dependent: :destroy
	has_many :answers, :through => :answer_questions
end
