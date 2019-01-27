class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Rails.application.routes.url_helpers
  before_action :authenticate_user!
end
