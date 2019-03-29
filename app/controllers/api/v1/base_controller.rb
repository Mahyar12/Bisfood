class Api::V1::BaseController < ActionController::Base
  include Knock::Authenticable


  respond_to :json
  protect_from_forgery with: :null_session

  
  before_action :destroy_session
	before_action :authenticate_user, except: [:create, :sign_up]
 
  def current_user
  	if token
  		@_current_user ||= begin 
  			Knock::AuthToken.new(token: token).entity_for(User)
  		rescue
  			nil
  		end
  	else
  		super
  	end
  end

  def destroy_session
    request.session_options[:skip] = true 
  end

  private

  def authenticate_entity(entity_name)
  	if token
  		super(entity_name)
  	else
  		current_user
  	end
  end

end
