class UserCompetition < ApplicationRecord
	after_initialize :set_defaults, unless: :persisted?
	belongs_to :user 
	belongs_to :competition

	def set_defaults
    	self.status  = 0 if self.status.nil?    
    	self.points  = 0 if self.points.nil?    
  	end
end
