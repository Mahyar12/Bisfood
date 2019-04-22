class GameProfilesController < InheritedResources::Base

  private

    def game_profile_params
      params.require(:game_profile).permit(:points, :money, :level)
    end

end
