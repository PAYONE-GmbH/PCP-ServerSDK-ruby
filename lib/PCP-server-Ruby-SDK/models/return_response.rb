require_relative 'model_base'

module PCPServerSDK
  module Models
    class ReturnResponse < ModelBase
      attribute :return_payment_response, :returnPaymentResponse, :RefundPaymentResponse
      attribute :shopping_cart, :shoppingCart, :ShoppingCartResult
    end
  end
end
