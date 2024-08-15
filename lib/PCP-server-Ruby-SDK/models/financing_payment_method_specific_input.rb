require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing the specific input details for financing payment methods (Buy Now Pay Later)
    class FinancingPaymentMethodSpecificInput < PCPServerSDK::ApiModel
      # Payment product identifier - please check product documentation for a full overview of possible values. Currently supported payment methods * 3390 - PAYONE Secured Invoice * 3391 - PAYONE Secured Installment * 3392 - PAYONE Secured Direct Debit
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # - true = the payment requires approval before the funds will be captured using the Approve payment or Capture payment API 
      # - false = the payment does not require approval, and the funds will be captured automatically  If the parameter is not provided in the request, the default value will be true
      # @return [Boolean, nil]
      attr_accessor :requires_approval

      # @return [PCPServerSDK::PaymentProduct3392SpecificInput, nil]
      attr_accessor :payment_product3392_specific_input

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_product_id == o.payment_product_id &&
            requires_approval == o.requires_approval &&
            payment_product3392_specific_input == o.payment_product3392_specific_input
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_product_id, requires_approval, payment_product3392_specific_input].hash
      end

      def to_hash
        hash = {}
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['requiresApproval'] = @requires_approval unless @requires_approval.nil?
        hash['paymentProduct3392SpecificInput'] = @payment_product3392_specific_input.to_hash unless @payment_product3392_specific_input.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @requires_approval = hash['requiresApproval'] if hash.key? 'requiresApproval'
        if hash.key? 'paymentProduct3392SpecificInput'
          @payment_product3392_specific_input = PaymentProduct3392SpecificInput.new_from_hash(hash['paymentProduct3392SpecificInput'])
        end
      end
    end
  end
end
