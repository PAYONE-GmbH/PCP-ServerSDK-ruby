require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Detailed information regarding an occurred payment event.
    class CartItemOrderStatus < PCPServerSDK::ApiModel
      # Should be one of the string constants provided by {PCPServerSDK::Models::CartItemStatus}
      # @return [String, nil] cart_item_status
      attr_accessor :cart_item_status

      # Amount of units for which this status is applicable, should be greater than zero
      # @return [Integer, nil]
      attr_accessor :quantity

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            cart_item_status == o.cart_item_status &&
            quantity == o.quantity
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [cart_item_status, quantity].hash
      end

      def to_hash
        hash = {}
        hash['cartItemStatus'] = @cart_item_status unless @cart_item_status.nil?
        hash['quantity'] = @quantity unless @quantity.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'cartItemStatus'
          @cart_item_status = CartItemStatus.validate(hash['cartItemStatus'])
        end
        @quantity = hash['quantity'] if hash.key? 'quantity'
      end
    end
  end
end
