module PCPServerSDK
  module Models
    # Request to mark items as of the respective Checkout as cancelled and to automatically reverse the associated payment.  A Cancel can be created for a full or the partial ShoppingCart of the Checkout.  The platform will automatically calculate the respective amount to trigger the Cancel. For a partial Cancel a list of items must be provided.  The cancellationReason is mandatory for BNPL payment methods (paymentProductId 3390, 3391 and 3392). For other payment methods the cancellationReason is not mandatory but can be used for reporting and reconciliation purposes.
    class CancelRequest < PCPServerSDK::ApiModel
      # Should be one of the string constants provided by {PCPServerSDK::Models::CancelType}
      # @return [String, nil]
      attr_accessor :cancel_type

      # Should be one of the string constants provided by {PCPServerSDK::Models::CancellationReason}
      # @return [String, nil]
      attr_accessor :cancellation_reason

      # @return [Array<PCPServerSDK::Models::CancelItem>, nil]
      attr_accessor :cancel_items

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            cancel_type == o.cancel_type &&
            cancellation_reason == o.cancellation_reason &&
            cancel_items == o.cancel_items
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [cancel_type, cancellation_reason, cancel_items].hash
      end

      def to_hash
        hash = {}
        hash['cancelType'] = @cancel_type unless @cancel_type.nil?
        hash['cancellationReason'] = @cancellation_reason unless @cancellation_reason.nil?
        hash['cancelItems'] = @cancel_items.map(&:to_hash) unless @cancel_items.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'cancelType'
          @cancel_type = CancelType.validate(hash['cancelType'])
        end
        if hash.key? 'cancellationReason'
          @cancellation_reason = CancellationReason.validate(hash['cancellationReason'])
        end
        if hash.key? 'cancelItems'
          @cancel_items = CancelItem.new_from_hash_array(hash['cancelItems'])
        end
      end
    end
  end
end
