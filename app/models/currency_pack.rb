class CurrencyPack < ApplicationRecord
	after_initialize :set_defaults, unless: :persisted?

	def set_defaults
    	self.price  = 0 if self.price.nil?    
    	self.amount  = 0 if self.amount.nil?    
    	self.discount  = 0 if self.discount.nil?    
  	end
end
