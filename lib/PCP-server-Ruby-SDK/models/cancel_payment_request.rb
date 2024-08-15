require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    class CancelPaymentRequest < PCPServerSDK::ApiModel
      # Should be one of the string constants provided by {PCPServerSDK::Models::CancellationReason}
      # @return [String, nil]
      attr_accessor :cancellation_reason

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            cancellation_reason == o.cancellation_reason
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [cancellation_reason].hash
      end

      def to_hash
        hash = {}
        hash['cancellationReason'] = @cancellation_reason unless @cancellation_reason.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @cancellation_reason = CancellationReason.validate(hash['cancellationReason']) if hash.key? 'cancellationReason'
      end
    end
  end
end
