require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Request to mark items of the respective Checkout as returned and to automatically refund a payment for those items.  A Return can be created for a full or the partial ShoppingCart of the Checkout.  The platform will automatically calculate the respective amount to trigger the Refund. For a partial Return a list of items must be provided. The item details for the Refund will be automatically loaded from the Checkout.        The returnReason can be provided for reporting and reconciliation purposes but is not mandatory.
    class ReturnRequest < PCPServerSDK::ApiModel
      # Should be one of string constants provided by {PCPServerSDK::Models::ReturnType}
      # @return [String, nil]
      attr_accessor :return_type

      # Reason of the Refund (e.g. communicated by or to the consumer).
      # @return [String, nil]
      attr_accessor :return_reason

      # @return [Array<PCPServerSDK::Models::ReturnItem>, nil]
      attr_accessor :return_items

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            return_type == o.return_type &&
            return_reason == o.return_reason &&
            return_items == o.return_items
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [return_type, return_reason, return_items].hash
      end

      def to_hash
        hash = {}
        hash['returnType'] = @return_type unless @return_type.nil?
        hash['returnReason'] = @return_reason unless @return_reason.nil?
        hash['returnItems'] = @return_items.map(&:to_hash) unless @return_items.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'returnType'
          @return_type = ReturnType.validate(hash['returnType'])
        end
        @return_reason = hash['returnReason'] if hash.key? 'returnReason'
        if hash.key? 'returnItems'
          @return_items = ReturnItem.new_from_hash_array(hash['returnItems'])
        end
      end
    end
  end
end
