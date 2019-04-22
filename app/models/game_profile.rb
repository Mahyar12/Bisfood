class GameProfile < ApplicationRecord
	after_initialize :set_defaults, unless: :persisted?
	belongs_to :user
	
	def set_defaults
    	self.points  = 0 if self.points.nil?    
    	self.money  = 0 if self.money.nil?    
    	self.level  = 0 if self.level.nil?        	
  	end
end
