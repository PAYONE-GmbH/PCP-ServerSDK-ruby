require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # To complete the Payment the completeFinancingMethodSpecificInput has to be provided. At the moment it is only available for PAYONE Secured Installment (paymentProductId 3391).
    class CompleteFinancingPaymentMethodSpecificInput < PCPServerSDK::ApiModel
      # Payment product identifier. Currently supported payment methods: * 3391 - PAYONE Secured Installment
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # - true = the payment requires approval before the funds will be captured using the Approve payment or Capture payment API
      # - false = the payment does not require approval, and the funds will be captured automatically
      # If the parameter is not provided in the request, the default value will be true
      #
      # @return [Boolean, nil]
      attr_accessor :requires_approval

      # @return [PCPServerSDK::Models::PaymentProduct3391SpecificInput, nil]
      attr_accessor :payment_product3391_specific_input

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_product_id == o.payment_product_id &&
            requires_approval == o.requires_approval &&
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
        [payment_product_id, requires_approval, payment_product3391_specific_input].hash
      end

      def to_hash
        hash = {}
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['requiresApproval'] = @requires_approval unless @requires_approval.nil?
        hash['paymentProduct3391SpecificInput'] = @payment_product3391_specific_input.to_hash unless @payment_product3391_specific_input.nil?
        hash
      end

      def from_hash(hash)
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @requires_approval = hash['requiresApproval'] if hash.key? 'requiresApproval'
        if hash.key? 'paymentProduct3391SpecificInput'
          @payment_product3391_specific_input = PaymentProduct3391SpecificInput.new_from_hash(hash['paymentProduct3391SpecificInput'])
        end
      end
    end
  end
end
