class MessagesController < InheritedResources::Base
  
  private

    def message_params
      params.require(:message).permit(:mtext, :user_id)
    end

end
