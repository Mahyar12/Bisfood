class Friend < ApplicationRecord
  belongs_to :suser, :class_name => 'User'
  belongs_to :user
  after_create {|friend| friend.message 'create' }
  after_update {|friend| friend.message 'update' }

  def message action
		# u = self.subs.chat.user.user_identification		
		msg = { resource: 'friends',
		        action: action,
		        id: self.id,
		        status: self.status,
		        user: self.user.user_identification,
		        username: self.user.username,
		        suser: self.suser.user_identification,
		        susername: self.suser.username
		    }

		$redis.publish 'new_message', msg.to_json
  end
end
