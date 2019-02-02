class Friend < ApplicationRecord
  belongs_to :suser, :class_name => 'User'
  belongs_to :user
end
