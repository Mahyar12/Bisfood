module Api
  module V1
    class UsersController < Api::V1::BaseController
      # require 'httparty'

      def search
        if params.has_key? (:query) and params[:query].length >= 2
          @users = User.text_search(params[:query])
          render json: @users
        else
          render json: {result: "ERROR", message: "Not enough parameters are sent", status: 404}
        end

      end

      def sign_up 
        if params.has_key? (:username) and params.has_key? (:playfab_id) and params.has_key? (:email) and params.has_key? (:password) and params.has_key? (:session)
          @u = User.new(username: params[:username], user_identification: params[:playfab_id], email: params[:email], password: params[:password], password_confirmation: params[:password])
          if @u.playfab_authenticate(params[:playfab_id], params[:session]) == true
            if @u.save
              render json: {result: "OK", message: "User created successfully", status: 200}
            else
              render json: {result: "ERROR", message: "Error creating user. Duplication user.", status: 404}
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
