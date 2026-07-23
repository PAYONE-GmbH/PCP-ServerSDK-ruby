require_relative 'model_base'

module PCPServerSDK
  module Models
    class Order < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :customer, :customer, :Customer
      attribute :references, :references, :References
      attribute :shipping, :shipping, :Shipping
      attribute :shopping_cart, :shoppingCart, :ShoppingCartInput
    end
  end
end
