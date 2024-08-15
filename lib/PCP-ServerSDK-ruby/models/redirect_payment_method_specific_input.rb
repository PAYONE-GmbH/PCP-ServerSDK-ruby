require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing the specific input details for payments that involve redirects to 3rd parties to complete, like iDeal and PayPal
    class RedirectPaymentMethodSpecificInput < PCPServerSDK::ApiModel
      # - true = the payment requires approval before the funds will be captured using the Approve payment or Capture payment API
      # - false = the payment does not require approval, and the funds will be captured automatically
      # If the parameter is not provided in the request, the default value will be true
      # @return [Boolean, nil]
      attr_accessor :requires_approval

      # ID of the token to use to create the payment.
      # @return [String, nil]
      attr_accessor :payment_processing_token

      # Token to identify the card in the reporting.
      # @return [String, nil]
      attr_accessor :reporting_token

      # Indicates if this transaction should be tokenized   * true - Tokenize the transaction.   * false - Do not tokenize the transaction, unless it would be tokenized by other means such as auto- tokenization of recurring payments. example: false
      # @return [Boolean, nil]
      attr_accessor :tokenize

      # Payment product identifier - please check product documentation for a full overview of possible values.
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # @return [PCPServerSDK::Models::RedirectPaymentProduct840SpecificInput, nil]
      attr_accessor :payment_product840_specific_input

      # @return [PCPServerSDK::Models::RedirectionData, nil]
      attr_accessor :redirection_data

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            requires_approval == o.requires_approval &&
            payment_processing_token == o.payment_processing_token &&
            reporting_token == o.reporting_token &&
            tokenize == o.tokenize &&
            payment_product_id == o.payment_product_id &&
            payment_product840_specific_input == o.payment_product840_specific_input &&
            redirection_data == o.redirection_data
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [requires_approval, payment_processing_token, reporting_token, tokenize, payment_product_id, payment_product840_specific_input, redirection_data].hash
      end

      def to_hash
        hash = {}
        hash['requiresApproval'] = @requires_approval unless @requires_approval.nil?
        hash['paymentProcessingToken'] = @payment_processing_token unless @payment_processing_token.nil?
        hash['reportingToken'] = @reporting_token unless @reporting_token.nil?
        hash['tokenize'] = @tokenize unless @tokenize.nil?
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['paymentProduct840SpecificInput'] = @payment_product840_specific_input.to_hash unless @payment_product840_specific_input.nil?
        hash['redirectionData'] = @redirection_data.to_hash unless @redirection_data.nil?
        hash
      end

      def from_hash(hash)
        @requires_approval = hash['requiresApproval'] if hash.key? 'requiresApproval'
        @payment_processing_token = hash['paymentProcessingToken'] if hash.key? 'paymentProcessingToken'
        @reporting_token = hash['reportingToken'] if hash.key? 'reportingToken'
        @tokenize = hash['tokenize'] if hash.key? 'tokenize'
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        if hash.key? 'paymentProduct840SpecificInput'
          @payment_product840_specific_input = PaymentProduct840SpecificOutput.new_from_has(hash['paymentProduct840SpecificInput'])
        end
        if hash.key? 'redirectionData'
          @redirection_data = RedirectionData.new_from_(hash['redirectionData'])
        end
      end
    end
  end
end
