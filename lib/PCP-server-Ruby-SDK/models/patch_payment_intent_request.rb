require_relative 'model_base'

module PCPServerSDK
  module Models
    class PatchPaymentIntentRequest < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :shopping_cart, :shoppingCart, :ShoppingCartData
    end
  end
end
