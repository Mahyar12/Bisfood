class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats
  has_many :schats, :class_name => 'Chat', :foreign_key => 'suser_id'

  has_many :friends
  has_many :sfriends, :class_name => 'Friend', :foreign_key => 'suser_id'
  
  has_many :messages

  has_many :user_cups
  has_many :cups, :through => :user_cups

  has_many :user_competitions
  has_many :competitions, :through => :user_competitions

  has_many :user_answers
  has_one :game_profile
  
  
	before_validation :downcase_username
  validates_uniqueness_of :username
  validates_uniqueness_of :user_identification
  validates_uniqueness_of :device_id

  

  alias authenticate valid_password?

  def self.text_search(query)
    self.where("similarity(username, ?) > 0.2", query).order("similarity(username, #{ActiveRecord::Base.connection.quote(query)}) DESC").limit(10)
  end

  def playfab_authenticate id, session
  	# url = "https://#{title_id}.playfabapi.com/Client/LoginWithCustomID"
  	url = "https://631A.playfabapi.com/Client/GetAccountInfo"
		headers = {'Content-Type' => 'application/json', 'X-Authentication' => session }


		response = HTTParty.post(url, :body => { 
			"PlayFabId": id
		}.to_json, :headers => headers)
		return response["status"] == "OK"
  end

  def serializable_hash(options = nil)
    options = options.try(:dup) || {}
    options[:except] = Array(options[:except])

    if options[:force_except]
      options[:except].concat Array(options[:force_except])
    else
      options[:except].concat [:device_id]
    end

    super(options)
  end


	private
	def downcase_username
	  self.username = username.downcase
	end
end

