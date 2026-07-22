require_relative 'model_base'

module PCPServerSDK
  module Models
    class CancelResponse < ModelBase
      attribute :cancel_payment_response, :cancelPaymentResponse, :CancelPaymentResponse
      attribute :shopping_cart, :shoppingCart, :ShoppingCartResult
    end
  end
end
