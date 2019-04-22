module Api
  module V1
    class CupsController < Api::V1::BaseController
      # require 'httparty'
      def index         
        @c = Competition.all
        render json: @c        
      end

      def user_competitions
        begin
          if params.has_key? (:user_id) and not params[:user_id].nil?
            u = User.find_by_user_identification(params[:user_id])          
            @c = u.competitions
            render json: @c
          else
            render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
          end
        rescue Exception => e 
          logger.error e.message
          e.backtrace.each { |line| logger.error line }
          render json: {result: "ERROR", message: "Error showing competition list.", status: 404}
        end  
      end

      def start_competition

      end

      def end_competition

      end

      def update_competition

      end

      def questions

      end

      def users

      end

      def winner

      end

      def most_game_played

      end

      def most_win

      end

      def most_cup

      end

      def consecutive_win

      end

      def most_daily_cup
         
      end 
      
    end
  end
end
