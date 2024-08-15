require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing the specific input details for SEPA direct debit payments
    class SepaDirectDebitPaymentMethodSpecificInput < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::SepaDirectDebitPaymentProduct771SpecificInput, nil]      attr_accessor :payment_product771_specific_input

      # Payment product identifier - please check product documentation for a full overview of possible values.
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_product771_specific_input == o.payment_product771_specific_input &&
            payment_product_id == o.payment_product_id
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_product771_specific_input, payment_product_id].hash
      end

      def to_hash
        hash = {}
        hash['paymentProduct771SpecificInput'] = @payment_product771_specific_input.to_hash unless @payment_product771_specific_input.nil?
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'paymentProduct771SpecificInput'
          @payment_product771_specific_input = SepaDirectDebitPaymentProduct771SpecificInput.new_from_hash(hash['paymentProduct771SpecificInput'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
      end
    end
  end
end
