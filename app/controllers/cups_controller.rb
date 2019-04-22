class CupsController < InheritedResources::Base

  private

    def cup_params
      params.require(:cup).permit(:name)
    end

end
