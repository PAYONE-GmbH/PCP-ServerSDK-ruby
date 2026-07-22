require_relative 'model_base'

module PCPServerSDK
  module Models
    class CheckoutResponse < ModelBase
      # reference to the Commerce Case.
      attribute :commerce_case_id, :commerceCaseId, :String
      # reference to the Checkout.
      attribute :checkout_id, :checkoutId, :String
      # Unique identifier for the customer.
      attribute :merchant_customer_id, :merchantCustomerId, :String
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :references, :references, :CheckoutReferences
      attribute :shipping, :shipping, :Shipping
      attribute :shopping_cart, :shoppingCart, :ShoppingCartResult
      attribute :payment_executions, :paymentExecutions, "Array<PaymentExecution>"
      attribute :checkout_status, :checkoutStatus, :StatusCheckout
      attribute :status_output, :statusOutput, :StatusOutput
      attribute :payment_information, :paymentInformation, "Array<PaymentInformationResponse>"
      attribute :creation_date_time, :creationDateTime, :Time
      attribute :allowed_payment_actions, :allowedPaymentActions, "Array<AllowedPaymentActions>"
    end
  end
end
