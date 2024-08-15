require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing the specific output details for financing payment methods (Buy Now Pay Later)
    class FinancingPaymentMethodSpecificOutput < PCPServerSDK::ApiModel
      # Payment product identifier - please check product documentation for a full overview of possible values. Currently supported payment methods * 3390 - PAYONE Secured Invoice * 3391 - PAYONE Secured Installment * 3392 - PAYONE Secured Direct Debit
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # @return [PCPServerSDK::PaymentProduct3391SpecificOutput, nil]
      attr_accessor :payment_product3391_specific_output

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_product_id == o.payment_product_id &&
            payment_product3391_specific_output == o.payment_product3391_specific_output
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_product_id, payment_product3391_specific_output].hash
      end

      def to_hash
        hash = {}
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['paymentProduct3391SpecificOutput'] = @payment_product3391_specific_output.to_hash unless @payment_product3391_specific_output.nil?
        hash
      end

      def from_hash(hash)
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        if hash.key? 'paymentProduct3391SpecificOutput'
          @payment_product3391_specific_output = PaymentProduct3391SpecificOutput.new_from_hash(hash['paymentProduct3391SpecificOutput'])
        end
      end
    end
  end
end
