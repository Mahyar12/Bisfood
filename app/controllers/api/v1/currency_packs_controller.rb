module Api
  module V1
    class CurrencyPacksController < Api::V1::BaseController
      # require 'httparty'
      def index         
        @cps = CurrencyPack.all
        render json: @cps        
      end

      def buy_pack
        begin
          if params.has_key? (:user_id) and not params[:user_id].nil? and params.has_key? (:pack_id) and not params[:pack_id].nil?
            u = User.find_by_user_identification(params[:user_id])          
            @cp= CurrencyPack.find_by_id(params[:pack_id])
            if not u.nil? and not @cp.nil?
              u.game_profile.update(money: @cp.amount)
              render json: @cp
            else
              render json: {result: "ERROR", message: "Wrong parameters!", status: 404}
            end
          else
            render json: {result: "ERROR", message: "not enough parameters are sent", status: 404}
          end
        rescue Exception => e 
          logger.error e.message
          e.backtrace.each { |line| logger.error line }
          render json: {result: "ERROR", message: "Error buying pack.", status: 404}
        end  
      end
    end
  end
end
