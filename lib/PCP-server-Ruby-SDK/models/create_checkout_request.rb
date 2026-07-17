require_relative 'model_base'

module PCPServerSDK
  module Models
    class CreateCheckoutRequest < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :references, :references, :CheckoutReferences
      attribute :shipping, :shipping, :Shipping
      attribute :shopping_cart, :shoppingCart, :ShoppingCartInput
      attribute :order_request, :orderRequest, :OrderRequest
      attribute :creation_date_time, :creationDateTime, :Time
      # Set this flag to directly execute a payment when creating a Commerce Case or Checkout.
      # If the value for autoExecuteOrder is set to true, the paymentMethodSpecificInput for the order is mandatory
      # and has to be provided. The autoExecuteOrder can only be used for orderType = full.
      # If no shoppingCart information has been provided, a Payment Execution will be created instead of an Order. As a consequence, only Payment Execution endpoints can be used.
      attribute :auto_execute_order, :autoExecuteOrder, :Boolean, default: false
    end
  end
end
