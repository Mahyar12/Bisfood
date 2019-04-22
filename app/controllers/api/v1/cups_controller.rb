module Api
  module V1
    class CupsController < Api::V1::BaseController
      # require 'httparty'
      def index         
        @cups = Cup.all
        render json: @cups        
      end

      def user_cups
        begin
          if params.has_key? (:user_id) and not params[:user_id].nil?
            u = User.find_by_user_identification(params[:user_id])          
            @cups = u.cups
            render json: @cups
          else
            render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
          end
        rescue Exception => e 
          logger.error e.message
          e.backtrace.each { |line| logger.error line }
          render json: {result: "ERROR", message: "Error showing cups.", status: 404}
        end  
      end
    end
  end
end
