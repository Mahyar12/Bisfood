class CategoryAnswer < ApplicationRecord
	belongs_to :answer
	belongs_to :category
end
