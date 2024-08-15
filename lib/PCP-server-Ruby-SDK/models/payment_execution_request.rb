require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Request to trigger a payment for a respective Checkout providing the input for a specific payment method.  The data from the Commerce case and the Checkout will not be loaded automatically and there is no validation between the data input in place.  Depending on the payment method, information of the customer and / or the shopping cart might be required.  For more details regarding payment method specific input please check the documentation.
    class PaymentExecutionRequest < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::PaymentMethodSpecificInput, nil]
      attr_accessor :payment_method_specific_input

      # @return [PCPServerSDK::Models::PaymentExecutionSpecificInput, nil]
      attr_accessor :payment_execution_specific_input

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_method_specific_input == o.payment_method_specific_input &&
            payment_execution_specific_input == o.payment_execution_specific_input
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_method_specific_input, payment_execution_specific_input].hash
      end

      def to_hash
        hash = {}
        hash['paymentMethodSpecificInput'] = @payment_method_specific_input.to_hash unless @payment_method_specific_input.nil?
        hash['paymentExecutionSpecificInput'] = @payment_execution_specific_input.to_hash unless @payment_execution_specific_input.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'paymentMethodSpecificInput'
          @payment_method_specific_input = PaymentMethodSpecificInput.new_from_hash(hash['paymentMethodSpecificInput'])
        end
        if hash.key? 'paymentExecutionSpecificInput'
          @payment_execution_specific_input = PaymentExecutionSpecificInput.new_from_hash(hash['paymentExecutionSpecificInput'])
        end
      end
    end
  end
end
