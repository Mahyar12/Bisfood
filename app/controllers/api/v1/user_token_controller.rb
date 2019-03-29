module Api
  	module V1
		class UserTokenController < Knock::AuthTokenController 
			protect_from_forgery with: :null_session
			before_action :destroy_session
			

			def destroy_session
		    	request.session_options[:skip] = true 
		  	end

		  	def entity
			      @entity ||=
			        if entity_class.respond_to? :from_token_request
			          entity_class.from_token_request request
			        else
			          if auth_params[:device_id].nil?
			          	return nil
			          end
			          entity_class.find_by username: auth_params[:username], device_id: auth_params[:device_id]
			          # puts "here"
			        end
			end

		 	def auth_params
		      params.require(:auth).permit :username, :device_id, :password
			end
		end
	end
end