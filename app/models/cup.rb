class Cup < ApplicationRecord
	has_many :user_cups
  	has_many :users, :through => :user_cups
end
