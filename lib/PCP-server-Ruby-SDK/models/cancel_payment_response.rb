require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    class CancelPaymentResponse < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::PaymentResponse, nil]
      attr_accessor :payment

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment == o.payment
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment].hash
      end

      def to_hash
        hash = {}
        hash['payment'] = @payment.to_hash unless @payment.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'payment'
          @payment = PaymentResponse.new_from_hash(hash['payment']) if hash.key? 'payment'
        end
      end
    end
  end
end
