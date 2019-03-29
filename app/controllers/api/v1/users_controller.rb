module Api
  module V1
    class UsersController < Api::V1::BaseController
      # require 'httparty'

      def search
        begin 
          if params.has_key? (:query) and not params[:query].nil? and params[:query].length >= 2
            @users = User.text_search(params[:query])
            render json: @users
          else
            render json: {result: "ERROR", message: "Not enough parameters are sent", status: 404}
          end
        rescue Exception => e 
          render json: {result: "ERROR", message: "Error creating user. Duplication user.", status: 404}
        end
      end

      def profile
        begin           
          render json: current_user
        rescue Exception => e 
          logger.error e.message
          e.backtrace.each { |line| logger.error line }
          render json: {result: "ERROR", message: "Unknown Error.", status: 404}
        end
      end

      def update_profile
        begin 
          if params.has_key? (:email) and not params[:email].nil?
            current_user.email = params[:email]
          end
          if params.has_key? (:phone_number) and not params[:phone_number].nil?
            current_user.phone_number = params[:phone_number]
          end
          if params.has_key? (:age) and not params[:age].nil?
            current_user.age = params[:age]
          end
          if params.has_key? (:city) and not params[:city].nil?
            current_user.city = params[:city]
          end
          if params.has_key? (:biography) and not params[:biography].nil?
            current_user.biography = params[:biography]
          end
          if params.has_key? (:money) and not params[:money].nil?
            current_user.phone_number = params[:money]
          end
          if current_user.save!
            render json: current_user
          else
            render json: {result: "ERROR", message: "Update Error.", status: 500}
          end
        rescue Exception => e 
          render json: {result: "ERROR", message: "Error creating user. Duplication user.", status: 404}
        end          
      end

      def sign_up 
        begin 
          if params.has_key? (:device_id) and not params[:device_id].nil? and params.has_key? (:username) and not params[:username].nil? and params.has_key? (:email) and not params[:email].nil? and params.has_key? (:password) and not params[:password].nil?
            @u = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password], device_id: params[:device_id])
            @u.user_identification = SecureRandom.urlsafe_base64(12)
            if params.has_key? (:phone_number) and not params[:phone_number].nil?
              current_user.phone_number = params[:phone_number]
            end
            if params.has_key? (:age) and not params[:age].nil?
              current_user.age = params[:age]
            end
            if params.has_key? (:city) and not params[:city].nil?
              current_user.city = params[:city]
            end
            if params.has_key? (:biography) and not params[:biography].nil?
              current_user.biography = params[:biography]
            end
            if params.has_key? (:money) and not params[:money].nil?
              current_user.phone_number = params[:money]
            end
            if @u.save
              render json: {result: "OK", message: "User created successfully", status: 200, user: @u}
            else
              render json: {result: "ERROR", message: "Error creating user. Duplication user.", status: 404}
            end
          else
            render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
          end
        rescue Exception => e 
          render json: {result: "ERROR", message: "Error creating user. Duplication user.", status: 404}
        end          
      end
    end
  end
end
