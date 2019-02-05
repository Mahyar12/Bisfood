module Api
  module V1
    class MessagesController < Api::V1::BaseController
        def new_message
          if params.has_key?(:from) and not params[:from].nil? and params.has_key?(:to) and not params[:to].nil? and params.has_key?(:message) and not params[:message].nil?
            @u1 = User.find_by_user_identification(params[:from])
            @u2 = User.find_by_user_identification(params[:to])
            if @u1 == nil or @u2 == nil
              render json: {result: "ERROR", message: "user id is not valid", status: 400}
              return
            end  
            c = Chat.where("(user_id = ? and suser_id = ?) or (user_id = ? and suser_id = ?)", @u1.id, @u2.id, @u2.id, @u1.id).first
            @m = c.messages.new(mtext: params[:message])
            @m.user = @u1
            @m.save!
            render json: @m
          else
            render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
          end
        end

        def index 
          if params.has_key?(:chat_id) and not params[:chat_id].nil?
            @messages = Chat.find(params[:chat_id]).messages
            @response = @messages.map do |m|
              { id: m.id, message: m.mtext, sender: m.user.user_identification }   
            end
            render json: @response
          else
            render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
          end
        end
    end
  end
end
