class UserAnswer < ApplicationRecord
	after_initialize :set_defaults, unless: :persisted?
	belongs_to :user 
	belongs_to :competition 
	belongs_to :question

	def set_defaults
    	self.status  = 0 if self.cup_count.nil?    
  	end
end
