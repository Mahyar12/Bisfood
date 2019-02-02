module Api
  module V1
    class ChatsController < Api::V1::BaseController
      # require 'httparty'
      def index 
        if params.has_key? (:user_id)            
          u = User.find_by_user_identification(params[:user_id])          
          @chats = Chat.where("user_id = ? or suser_id = ?", u.id, u.id)
          @response = @chats.map do |c|
            {id: c.id, user_id: c.user.user_identification, suser_id: c.suser.user_identification}
          end
          render json: @response
        else
          render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
        end
      end
    end
  end
end
