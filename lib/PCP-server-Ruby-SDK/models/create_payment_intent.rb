require_relative 'model_base'

module PCPServerSDK
  module Models
    class CreatePaymentIntent < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :references, :references, :PaymentReferences
      attribute :shopping_cart, :shoppingCart, :ShoppingCartData
    end
  end
end
