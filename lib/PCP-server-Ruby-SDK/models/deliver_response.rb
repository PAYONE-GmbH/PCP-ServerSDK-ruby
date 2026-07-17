require_relative 'model_base'

module PCPServerSDK
  module Models
    class DeliverResponse < ModelBase
      attribute :capture_payment_response, :capturePaymentResponse, :CapturePaymentResponse
      attribute :shopping_cart, :shoppingCart, :ShoppingCartResult
    end
  end
end
