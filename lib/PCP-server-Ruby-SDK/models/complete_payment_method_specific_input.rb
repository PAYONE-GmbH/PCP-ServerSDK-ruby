require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # To complete the Order the completePaymentMethodSpecificInput has to be provided, containing the selected installmentOptionId as well as the the bankAccountInformation of the customer.
    class CompletePaymentMethodSpecificInput < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::PaymentProduct3391SpecificInput, nil]
      attr_accessor :payment_product3391_specific_input

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_product3391_specific_input == o.payment_product3391_specific_input
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_product3391_specific_input].hash
      end

      def to_hash
        hash = {}
        hash['paymentProduct3391SpecificInput'] = @payment_product3391_specific_input.to_hash unless @payment_product3391_specific_input.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'paymentProduct3391SpecificInput'
          @payment_product3391_specific_input = PaymentProduct3391SpecificInput.new_from_hash(hash['paymentProduct3391SpecificInput'])
        end
      end
    end
  end
end
