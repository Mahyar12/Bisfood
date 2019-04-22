class UserCompetitionsController < InheritedResources::Base

  private

    def user_competition_params
      params.require(:user_competition).permit(:user_id, :competition_id, :status, :points)
    end

end
