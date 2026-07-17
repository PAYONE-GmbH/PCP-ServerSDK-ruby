require_relative 'model_base'

module PCPServerSDK
  module Models
    class CreatePaymentIntentResponse < ModelBase
      attribute :shopping_cart, :shoppingCart, :ShoppingCartData
      attribute :payment_intent_output, :paymentIntentOutput, :PaymentIntentOutput
    end
  end
end
