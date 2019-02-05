module Api
  module V1
    class FriendsController < Api::V1::BaseController   
      def index
        if params.has_key? (:user_id) and not params[:user_id].nil? 
          @u = User.find_by_user_identification(params[:user_id])
          @f = Friend.where("user_id = ? or suser_id = ?", @u.id, @u.id)
          render json: @f
        else
          render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
        end
      end

      def add_friend 
        if params.has_key? (:user_id) and not params[:user_id].nil? and params.has_key? (:friend_id) and not params[:friend_id].nil?
          @u = User.find_by_user_identification(params[:user_id])
          @f = User.find_by_user_identification(params[:friend_id])
          f1 = @u.friends.where("suser_id = ?", @f.id)
          f2 = @u.sfriends.where("user_id = ?", @f.id)
          if @u != nil and @f != nil      
            # puts f2.first.status   
            if (not f1.empty? and f1.first.status == 1) or (not f2.empty? and f2.first.status == 1)
              render json: { result: "ERROR", message: "Duplicate friend request", status: 404 }
              return
            end
            puts f1.first 
            puts f2.first
            puts @u.friends.new
            puts "heeeeee"
            if not f1.first.nil?
              new_friend = f1.first 
            elsif not f2.first.nil?
              new_friend = f2.first
            else 
              new_friend = @u.friends.new
            end
            new_friend.status = 1
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
        if params.has_key? (:accept) and not params[:accept].nil? and params.has_key? (:user_id) and not params[:user_id].nil? and params.has_key? (:friend_id) and not params[:friend_id].nil?
          @u = User.find_by_user_identification(params[:user_id])
          @f = User.find_by_user_identification(params[:friend_id])
          if @u != nil and @f != nil
            new_friend = Friend.find_by_user_id(@u.id)
            if new_friend.status != 1 
              render json: { result: "ERROR", message: "Cannot accept friend. It is already accepted or rejected. You must first send friend reqeust again.", status: 404 }
              return
            end
            new_friend.status = ((params[:accept] == 1)? 2 : 3)
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
