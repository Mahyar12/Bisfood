module Api
  module V1
    class FriendsController < Api::V1::BaseController      
      def add_friend 
        if params.has_key? (:user_id) and not params[:user_id].nil? and params.has_key? (:friend_id) and not params[:friend_id].nil?
          @u = User.find_by_user_identification(params[:user_id])
          @f = User.find_by_user_identification(params[:friend_id])
          if @u != nil and @f != nil
            if not (@u.friends.where("suser_id = ?", @f.id).empty? or @u.sfriends.where("user_id = ?", @f.id).empty?)
              render json: { result: "ERROR", message: "Duplicate friend request", status: 404 }
              return
            end
            new_friend = @u.friends.new(status: 1)
            new_friend.suser = @f 
          
            if new_friend.save 
              render json: {result: "OK", message: "User added as friend successfully", status: 200}
            else
              render json: {result: "ERROR", message: "Error friend.", status: 404}
            end
          else
            render json: {result: "ERROR", message: "No valid playfab id or session token", status: 404}
          end
        else 
          render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
        end
      end

      def accept_friend
        if params.has_key? (:user_id) and not params[:user_id].nil? and params.has_key? (:friend_id) and not params[:friend_id].nil?
          @u = User.find_by_user_identification(params[:user_id])
          @f = User.find_by_user_identification(params[:friend_id])
          if @u != nil and @f != nil
            new_friend = Friend.find_by_user_id(@u.id)
            new_friend.status = 2
            chat = @u.chats.new 
            chat.suser = @f             
            if new_friend.save and chat.save
              render json: {result: "OK", message: "User added as friend successfully", status: 200}
            else
              render json: {result: "ERROR", message: "Error friend.", status: 404}
            end
          else
            render json: {result: "ERROR", message: "No valid playfab id or session token", status: 404}
          end
        else 
          render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
        end          
      end
    end
  end
end
