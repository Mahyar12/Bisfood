class CompetitionsController < InheritedResources::Base

  private

    def competition_params
      params.require(:competition).permit(:status, :winner)
    end

end
