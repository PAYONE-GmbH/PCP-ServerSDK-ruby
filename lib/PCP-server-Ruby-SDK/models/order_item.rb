require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Items should only be provided for orderType = PARTIAL
    class OrderItem < PCPServerSDK::ApiModel
      # Id of the item from the ShoppingCart. The id will be returned in the response from create Checkout request.
      # @return [String, nil]
      attr_accessor :id

      # Quantity of the specific item. Must be greater than zero.  Note: Must not be all spaces or all zeros
      # @return [Integer, nil]
      attr_accessor :quantity

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            id == o.id &&
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
        [id, quantity].hash
      end

      def to_hash
        hash = {}
        hash['id'] = @id unless @id.nil?
        hash['quantity'] = @quantity unless @quantity.nil?
        hash
      end

      def from_hash(hash)
        @id = hash['id'] if hash.key? 'id'
        @quantity = hash['quantity'] if hash.key? 'quantity'
      end
    end
  end
end
