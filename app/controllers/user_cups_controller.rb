class UserCupsController < InheritedResources::Base

  private

    def user_cup_params
      params.require(:user_cup).permit(:user_id, :cup_id, :cup_count)
    end

end
