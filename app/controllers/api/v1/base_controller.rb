class Api::V1::BaseController < ActionController::Base
  respond_to :json
  protect_from_forgery with: :null_session

  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

end
