class Message < ApplicationRecord
	belongs_to :messageable, polymorphic: true
	belongs_to :user
	attr_accessor :num_pages, :title
	after_create {|book| book.message 'create' }
	after_update {|book| book.message 'update' }
	after_destroy {|book| book.message 'destroy' }

	def message action
		# u = self.subs.chat.user.user_identification
		msg = { resource: 'messages',
		        action: action,
		        id: self.id,
		        obj: self,
		        from: self.user.user_identification
		    }

		$redis.publish 'rt-change', msg.to_json
	end
end
