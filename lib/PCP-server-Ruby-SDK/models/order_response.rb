require_relative 'model_base'

module PCPServerSDK
  module Models
    class OrderResponse < ModelBase
      attribute :create_payment_response, :createPaymentResponse, :CreatePaymentResponse
      attribute :shopping_cart, :shoppingCart, :ShoppingCartResult
    end
  end
end
