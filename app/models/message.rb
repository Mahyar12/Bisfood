class Message < ApplicationRecord
	belongs_to :messageable, polymorphic: true
	belongs_to :user	
	after_create {|message| message.message 'create' }
	# after_update {|book| book.message 'update' }
	# after_destroy {|book| book.message 'destroy' }

	def message action
		# u = self.subs.chat.user.user_identification
		u = (self.messageable.user.user_identification == self.user.user_identification)? self.messageable.suser.user_identification : self.messageable.user.user_identification
		msg = { resource: 'messages',
		        action: action,
		        id: self.id,
		        message: self.mtext,
		        from: self.user.user_identification,
		        to: u
		    }

		$redis.publish 'new_message', msg.to_json
	end
end
