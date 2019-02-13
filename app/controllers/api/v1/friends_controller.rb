module Api
  module V1
    class FriendsController < Api::V1::BaseController   
      def index
        if params.has_key? (:user_id) and not params[:user_id].nil? 
          @u = User.find_by_user_identification(params[:user_id])
          @f = Friend.where("user_id = ? or suser_id = ?", @u.id, @u.id)
          @response = @f.map do |friend|
            {id: friend.id, status: friend.status, user_id: friend.user.user_identification,  suser_id: friend.suser.user_identification, created_at: friend.created_at, updated_at: friend.updated_at}
          end
          puts "hhhh"
          puts @response.empty?
          render json: @response
        else
          render json: {result: "ERROR", message: "Not enough parameters are sent", status: 404}
        end
      end

      def unfollow
        if params.has_key? (:user_id) and not params[:user_id].nil? and params.has_key? (:friend_id) and not params[:friend_id].nil?
          @u1 = User.find_by_user_identification(params[:user_id])
          @u2 = User.find_by_user_identification(params[:friend_id])
          if not @u1.nil? and not @u2.nil?
            @f = Friend.where("(user_id = ? and suser_id = ?) or (user_id =? and suser_id = ?)", @u1.id, @u2.id, @u2.id, @u1.id).first
            @c = Chat.where("(user_id = ? and suser_id = ?) or (user_id =? and suser_id = ?)", @u1.id, @u2.id, @u2.id, @u1.id).first
            if not @f.nil? and not @c.nil?
              if @c.destroy and @f.destroy
                render json: {result: "OK", message: "User unfollowed as friend successfully", status: 200}
              else
                render json: {result: "ERROR", message: "Error unfollowing friend.", status: 404}
              end
            else
              render json: {result: "ERROR", message: "Friendship does not exist.", status: 404}
            end
          else
            render json: {result: "ERROR", message: "No valid playfab id.", status: 404}
          end
        else 
          render json: {result: "ERROR", message: "Not enough parameters are sent", status: 404}
        end
      end

      def add_friend 
        if params.has_key? (:user_id) and not params[:user_id].nil? and params.has_key? (:friend_id) and not params[:friend_id].nil?
          @u = User.find_by_user_identification(params[:user_id])
          @f = User.find_by_user_identification(params[:friend_id])
          
          if @u != nil and @f != nil      
            f1 = @u.friends.where("suser_id = ?", @f.id)
            f2 = @u.sfriends.where("user_id = ?", @f.id)
            # puts f2.first.status   
            if (not f1.empty? and ((f1.first.status == 1) or (f1.first.status == 2))) or (not f2.empty? and ((f2.first.status == 1) or (f2.first.status == 2))) 
              render json: { result: "ERROR", message: "Duplicate friend request", status: 404 }
              return
            end

            if not f1.first.nil?
              new_friend = f1.first 
              new_friend.user = @u
              new_friend.suser = @f 
            elsif not f2.first.nil?
              new_friend = f2.first
              new_friend.user = @u
              new_friend.suser = @f 
            else 
              new_friend = @u.friends.new
              new_friend.suser = @f
            end
            new_friend.status = 1
            
          
            if new_friend.save 
              render json: {result: "OK", message: "User added as friend successfully", status: 200}
            else
              render json: {result: "ERROR", message: "Error friend.", status: 404}
            end
          else
            render json: {result: "ERROR", message: "No valid playfab id", status: 404}
          end
        else 
          render json: {result: "ERROR", message: "Not enough parameters are sent", status: 404}
        end
      end

      def accept_friend
        if params.has_key? (:accept) and not params[:accept].nil? and params.has_key? (:user_id) and not params[:user_id].nil? and params.has_key? (:friend_id) and not params[:friend_id].nil?
          @u = User.find_by_user_identification(params[:user_id])
          @f = User.find_by_user_identification(params[:friend_id])
          if @u != nil and @f != nil
            new_friend = @u.friends.where("suser_id = ?", @f.id).first
            if new_friend.nil?
              render json: { result: "ERROR", message: "No friend reqeust." , status: 404 }
              return
            end
            if new_friend.status != 1 
              render json: { result: "ERROR", message: "Cannot accept friend. It is already accepted or rejected." , status: 404 }
              return
            end
            new_friend.status = ((params[:accept] == 1)? 2 : 3)
            if new_friend.status == 2
              chat = @u.chats.new 
              chat.suser = @f         
              chat.save 
            end   
            if new_friend.save 
              render json: {result: "OK", message: "User added as friend successfully", status: 200}
            else
              render json: {result: "ERROR", message: "Error friend.", status: 404}
            end
          else
            render json: {result: "ERROR", message: "No valid playfab id", status: 404}
          end
        else 
          render json: {result: "ERROR", message: "Not enough parameters are sent", status: 404}
        end          
      end
    end
  end
end
