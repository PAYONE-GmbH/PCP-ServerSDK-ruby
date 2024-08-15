require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing the redirect payment product details.
    class RedirectPaymentMethodSpecificOutput < PCPServerSDK::ApiModel
      # <- Payment product identifier - please check product documentation for a full overview of possible values.
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # @return [PCPServerSDK::Models::PaymentProduct840SpecificOutput, nil]
      attr_accessor :payment_product840_specific_output

      # ID of the token. This property is populated when the payment was done with a token.
      # @return [String, nil]
      attr_accessor :payment_processing_token

      # Token to identify the card in the reporting.
      # @return [String, nil]
      attr_accessor :reporting_token

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_product_id == o.payment_product_id &&
            payment_product840_specific_output == o.payment_product840_specific_output &&
            payment_processing_token == o.payment_processing_token &&
            reporting_token == o.reporting_token
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_product_id, payment_product840_specific_output, payment_processing_token, reporting_token].hash
      end

      def to_hash
        hash = {}
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['paymentProduct840SpecificOutput'] = @payment_product840_specific_output.to_hash unless @payment_product840_specific_output.nil?
        hash['paymentProcessingToken'] = @payment_processing_token unless @payment_processing_token.nil?
        hash['reportingToken'] = @reporting_token unless @reporting_token.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        if hash.key? 'paymentProduct840SpecificOutput'
          @payment_product840_specific_output = PaymentProduct840SpecificOutput.new_from_has(hash['paymentProduct840SpecificOutput'])
        end
        @payment_processing_token = hash['paymentProcessingToken'] if hash.key? 'paymentProcessingToken'
        @reporting_token = hash['reportingToken'] if hash.key? 'reportingToken'
      end
    end
  end
end
