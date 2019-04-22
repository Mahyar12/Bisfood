class CurrencyPacksController < InheritedResources::Base

  private

    def currency_pack_params
      params.require(:currency_pack).permit(:name, :price, :amount, :discount)
    end

end
