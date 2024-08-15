require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Request to mark items of the respective Checkout as delivered and to automatically execute a Capture.  A Deliver can be created for a full or the partial ShoppingCart of the Checkout.  The platform will automatically calculate the respective amount to trigger the Capture. For a partial Deliver a list of items must be provided. The item details for the Capture will be automatically loaded from the Checkout.     The cancellationReason must be provided if deliverType is set to PARTIAL and isFinal is set to true for BNPL payment methods (paymentProductId 3390, 3391 and 3392). For other payment methods the cancellationReason is not mandatory in this case but can be used for reporting and reconciliation purposes.
    class DeliverRequest < PCPServerSDK::ApiModel
      # Should be one of the string constants provided by {PCPServerSDK::Models::DeliverType}
      # @return [String, nil]
      attr_accessor :deliver_type

      # This property indicates whether this will be the final operation. For deliverType FULL, it is always the final operation. If deliverType PARTIAL is provided and the property is set to true, the remaining amount of the items will be cancelled and the items are marked as CANCELLED.
      # @return [Boolean, nil]
      attr_accessor :is_final

      # Should be one of the string constants provided by {PCPServerSDK::Models::CancellationReason}
      # @return [String, nil]
      attr_accessor :cancellation_reason

      # @return [Array<PCPServerSDK::Models::DeliverItem>, nil]
      attr_accessor :deliver_items

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            deliver_type == o.deliver_type &&
            is_final == o.is_final &&
            cancellation_reason == o.cancellation_reason &&
            deliver_items == o.deliver_items
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [deliver_type, is_final, cancellation_reason, deliver_items].hash
      end

      def to_hash
        hash = {}
        hash['deliverType'] = @deliver_type unless @deliver_type.nil?
        hash['isFinal'] = @is_final unless @is_final.nil?
        hash['cancellationReason'] = @cancellation_reason unless @cancellation_reason.nil?
        hash['deliverItems'] = @deliver_items.map(&:to_hash) unless @deliver_items.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'deliverType'
          @deliver_type = DeliverType.validate(hash['deliverType'])
        end
        @is_final = hash['isFinal'] if hash.key? 'isFinal'
        if hash.key? 'cancellationReason'
          @cancellation_reason = CancellationReason.validate(hash['cancellationReason'])
        end
        if hash.key? 'deliverItems'
          @deliver_items = DeliverItem.new_from_hash_array(hash['deliverItems'])
        end
      end
    end
  end
end
