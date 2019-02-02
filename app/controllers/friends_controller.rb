class FriendsController < InheritedResources::Base

  private

    def friend_params
      params.require(:friend).permit(:user_id, :suser_id)
    end

end
