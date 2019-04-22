class Competition < ApplicationRecord
	after_initialize :set_defaults, unless: :persisted?
	has_many :user_competitions
  	has_many :users, :through => :user_competitions

  	has_many :user_answers

  	def set_defaults
    	self.status  = 0 if self.status.nil?    
    	self.winner  = 0 if self.winner.nil?    
  	end
end
