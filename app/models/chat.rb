class Chat < ApplicationRecord
  belongs_to :suser, :class_name => 'User'
  belongs_to :user
  has_many :messages, as: :messageable, dependent: :destroy
end
