require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # If the shopping cart is specified, a Capture is made with the amount of the shopping cart for the items that are specified.
    class CapturePaymentRequest < PCPServerSDK::ApiModel
      # Here you can specify the amount that you want to capture (specified in cents, where single digit currencies are presumed to have 2 digits). The amount can be lower than the amount that was authorized, but not higher.   If left empty, the full amount will be captured and the request will be final.   If the full amount is captured, the request will also be final.
      # @return [Integer, nil]
      attr_accessor :amount

      # This property indicates whether this will be the final operation.  If the full amount should not captured but the property is set to true, the remaining amount will automatically be cancelled.
      # @return [Boolean, nil]
      attr_accessor :is_final

      # Should be one of the string constants provided by {PCPServerSDK::Models::CancellationReason}
      # @return [String, nil]
      attr_accessor :cancellation_reason

      # @return [PCPServerSDK::Models::PaymentReferences, nil]
      attr_accessor :references

      # @return [PCPServerSDK::Models::DeliveryInformation, nil] delivery
      attr_accessor :delivery

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount == o.amount &&
            is_final == o.is_final &&
            cancellation_reason == o.cancellation_reason &&
            references == o.references &&
            delivery == o.delivery
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [amount, is_final, cancellation_reason, references, delivery].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['amount'] = @amount unless @amount.nil?
        hash['isFinal'] = @is_final unless @is_final.nil?
        hash['cancellationReason'] = @cancellation_reason unless @cancellation_reason.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['delivery'] = @delivery.to_hash unless @delivery.nil?
        hash
      end

      def from_hash(hash)
        @amount = hash['amount'] if hash.key? 'amount'
        @is_final = hash['isFinal'] if hash.key? 'isFinal'
        if hash.key? 'cancellationReason'
          @cancellation_reason = CancellationReason.validate(hash['cancellationReason'])
        end
        if hash.key? 'references'
          @references = References.new_from_hash(hash['references'])
        end
        if hash.key? 'delivery'
          @delivery = DeliveryInformation.new_from_hash(hash['delivery'])
        end
      end
    end
  end
end
