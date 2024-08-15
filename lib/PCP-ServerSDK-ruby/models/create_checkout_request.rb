require 'date'
require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Request to create a Checkout for a Commerce Case. The payment for the Checkout can be directly executed if autoExecuteOrder = true. In this case, the paymentMethodSpecificInput must be provided and only a full order is possible.  If no amountOfMoney is provided, the platform will calculate the respective Checkout amount based on the cartItem productPrice and quantity.  In case of a payment error, the payment can be retried by providing the respective commerceCaseId and checkoutId to the the Order or Payment Execution endpoint.
    class CreateCheckoutRequest < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # @return [PCPServerSDK::Models::CheckoutReferences, nil]
      attr_accessor :references

      # @return [PCPServerSDK::Models::Shipping, nil]
      attr_accessor :shipping

      # @return [PCPServerSDK::Models::ShoppingCartInput, nil]
      attr_accessor :shopping_cart

      # @return [PCPServerSDK::Models::OrderRequest, nil]
      attr_accessor :order_request

      # Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX  All other formats may be ignored by the system.
      # @return [DateTime, nil]
      attr_accessor :creation_date_time

      # Set this flag to directly execute a payment when creating a Commerce Case or Checkout. If the value for autoExecuteOrder is set to true, the paymentMethodSpecificInput for the order is mandatory and has to be provided. The autoExecuteOrder can only be used for orderType = full. If no shoppingCart information has been provided, a Payment Execution will be created instead of an Order. As a consequence, only Payment Execution endpoints can be used.
      # @return [Boolean, nil]
      attr_accessor :auto_execute_order

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount_of_money == o.amount_of_money &&
            references == o.references &&
            shipping == o.shipping &&
            shopping_cart == o.shopping_cart &&
            order_request == o.order_request &&
            creation_date_time == o.creation_date_time &&
            auto_execute_order == o.auto_execute_order
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [amount_of_money, references, shipping, shopping_cart, order_request, creation_date_time, auto_execute_order].hash
      end

      def to_hash
        hash = {}
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['shipping'] = @shipping.to_hash unless @shipping.nil?
        hash['shoppingCart'] = @shopping_cart.to_hash unless @shopping_cart.nil?
        hash['orderRequest'] = @order_request.to_hash unless @order_request.nil?
        hash['creationDateTime'] = @creation_date_time.rfc3339(0) unless @creation_date_time.nil?
        hash['autoExecuteOrder'] = @auto_execute_order unless @auto_execute_order.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'references'
          @references = CheckoutReferences.new_from_hash(hash['references'])
        end
        if hash.key? 'shipping'
          @shipping = Shipping.new_from_hash(hash['shipping'])
        end
        if hash.key? 'shoppingCart'
          @shopping_cart = ShoppingCartInput.new_from_hash(hash['shoppingCart'])
        end
        if hash.key? 'orderRequest'
          @order_request = OrderRequest.new_from_hash(hash['orderRequest'])
        end
        @creation_date_time = DateTime.rfc3339(hash['creationDateTime']) if hash.key? 'creationDateTime'
        @auto_execute_order = hash['autoExecuteOrder'] if hash.key? 'autoExecuteOrder'
      end
    end
  end
end
