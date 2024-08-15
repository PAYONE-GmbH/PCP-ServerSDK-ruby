require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Request to execute an Order for the corresponding Checkout for a specific payment method. The provided data from the Commerce Case and the Checkout regarding customer, shipping, and ShoppingCart will be automatically loaded and used for the Payment Execution.  In case the paymentMethodSpecificInput has already been provided when creating the Commerce Case or Checkout, this input will automatically be used.  An Order can be created for a full or the partial ShoppingCart of the Checkout. For a partial Order a list of items must be provided. The platform will automatically calculate the respective amount to trigger the payment execution.
    class OrderRequest < PCPServerSDK::ApiModel
      # Should be one of the string constants provided by {PCPServerSDK::Models::OrderType}
      # @return [String, nil]
      attr_accessor :order_type

      # @return [PCPServerSDK::Models::References, nil]
      attr_accessor :order_references

      # @return [Array<PCPServerSDK::Models::OrderItem>, nil]
      attr_accessor :items

      # @return [PCPServerSDK::Models::PaymentMethodSpecificInput, nil]
      attr_accessor :payment_method_specific_input

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            order_type == o.order_type &&
            order_references == o.order_references &&
            items == o.items &&
            payment_method_specific_input == o.payment_method_specific_input
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [order_type, order_references, items, payment_method_specific_input].hash
      end

      def to_hash
        hash = {}
        hash['orderType'] = @order_type unless @order_type.nil?
        hash['orderReferences'] = @order_references.to_hash unless @order_references.nil?
        hash['items'] = @items.map(&:to_hash) unless @items.nil?
        hash['paymentMethodSpecificInput'] = @payment_method_specific_input.to_hash unless @payment_method_specific_input.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'orderType'
          @order_type = OrderType.validate(hash['orderType'])
        end
        if hash.key? 'orderReferences'
          @order_references = References.new_from_hash(hash['orderReferences'])
        end
        if hash.key? 'items'
          @items = OrderItem.new_from_hash_array(hash['items'])
        end
        if hash.key? 'paymentMethodSpecificInput'
          @payment_method_specific_input = PaymentMethodSpecificInput.new_from_hash(hash['paymentMethodSpecificInput'])
        end
      end
    end
  end
end
