require_relative 'model_base'

module PCPServerSDK
  module Models
    class PatchCheckoutRequest < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :references, :references, :CheckoutReferences
      attribute :shipping, :shipping, :Shipping
      attribute :shopping_cart, :shoppingCart, :ShoppingCartPatch
      attribute :payment_method_specific_input, :paymentMethodSpecificInput, :PaymentMethodSpecificInput
      attribute :payment_references, :paymentReferences, :References
    end
  end
end
