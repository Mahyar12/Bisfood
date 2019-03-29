module Api
  module V1
    class ChatsController < Api::V1::BaseController
      # require 'httparty'
      def index 
        if params.has_key? (:user_id) and not params[:user_id].nil?
          u = User.find_by_user_identification(params[:user_id])          
          @chats = Chat.where("user_id = ? or suser_id = ?", u.id, u.id)
          @response = @chats.map do |c|
            if not c.user.nil? and not c.suser.nil?
              {id: c.id, user_id: c.user.user_identification, username: c.user.username, suser_id: c.suser.user_identification, susername: c.suser.username}
            end
          end
          render json: @response
        else
          render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
        end
      end
    end
  end
end
