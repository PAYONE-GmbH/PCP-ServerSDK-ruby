require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Return object contains additional information about the return/shipment, which is the basis for the Refund. The amountOfMoney in the cartItem will not be used in the request.
    class ReturnInformation < PCPServerSDK::ApiModel
      # Reason of the Refund (e.g. communicated by or to the consumer).
      # @return [String, nil]
      attr_accessor :return_reason

      # Items returned.
      # @return [Array<PCPServerSDK::Models::CartItemInput>, nil]
      attr_accessor :items

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            return_reason == o.return_reason &&
            items == o.items
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [return_reason, items].hash
      end

      def to_hash
        hash = {}
        hash['returnReason'] = @return_reason unless @return_reason.nil?
        hash['items'] = @items.map(&:to_hash) unless @items.nil?
        hash
      end

      def from_hash(hash)
        @return_reason = hash['returnReason'] if hash.key? 'returnReason'
        if hash.key? 'items'
          @items = CartItemInput.new_from_hash_array(hash['items'])
        end
      end
    end
  end
end
