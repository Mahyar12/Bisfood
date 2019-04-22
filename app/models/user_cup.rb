class UserCup < ApplicationRecord
	after_initialize :set_defaults, unless: :persisted?
	belongs_to :user 
	belongs_to :cup

	def set_defaults
    	self.cup_count  = 0 if self.cup_count.nil?    
  	end
end
