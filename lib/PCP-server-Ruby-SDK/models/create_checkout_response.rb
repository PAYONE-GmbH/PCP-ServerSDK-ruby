require_relative 'model_base'

module PCPServerSDK
  module Models
    class CreateCheckoutResponse < ModelBase
      # Reference to the Checkout. Can be used for following requests to get and update the Checkout and execute the
      # payment.
      attribute :checkout_id, :checkoutId, :String
      attribute :shopping_cart, :shoppingCart, :ShoppingCartResult
      attribute :payment_response, :paymentResponse, :CreatePaymentResponse
      attribute :error_response, :errorResponse, :ErrorResponse
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :references, :references, :CheckoutReferences
      attribute :shipping, :shipping, :Shipping
      attribute :payment_execution, :paymentExecution, :PaymentExecution
      attribute :checkout_status, :checkoutStatus, :StatusCheckout
      attribute :status_output, :statusOutput, :StatusOutput
      attribute :creation_date_time, :creationDateTime, :Time
      attribute :allowed_payment_actions, :allowedPaymentActions, "Array<AllowedPaymentActions>"
    end
  end
end
