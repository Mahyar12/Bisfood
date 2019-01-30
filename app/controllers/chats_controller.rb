class ChatsController < InheritedResources::Base

  private

    def chat_params
      params.require(:chat).permit(:user_id, :suser_id)
    end

end
