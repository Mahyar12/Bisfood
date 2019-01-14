class Question < ApplicationRecord
	belongs_to :qtype
	has_many :category_questions
	has_many :categories, :through => :category_questions
	has_many :answer_questions
	has_many :answers, :through => :answer_questions
end
