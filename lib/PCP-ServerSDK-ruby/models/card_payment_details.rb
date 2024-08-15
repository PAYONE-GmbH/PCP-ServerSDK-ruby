require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Information for card payments realized at a POS.
    class CardPaymentDetails < PCPServerSDK::ApiModel
      # Reference to the card of the transaction.
      # @return [String, nil]
      attr_accessor :masked_card_number

      # ID of the token. This property is populated when the payment was done with a token.
      # @return [String, nil]
      attr_accessor :payment_processing_token

      # Token to identify the card in the reporting.
      # @return [String, nil]
      attr_accessor :reporting_token

      # Identifier for a successful authorization, reversal or refund. Usually provided by the issuer system. Only provided for card payments.
      # @return [String, nil]
      attr_accessor :card_authorization_id

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            masked_card_number == o.masked_card_number &&
            payment_processing_token == o.payment_processing_token &&
            reporting_token == o.reporting_token &&
            card_authorization_id == o.card_authorization_id
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [masked_card_number, payment_processing_token, reporting_token, card_authorization_id].hash
      end

      def to_hash
        hash = {}
        hash['maskedCardNumber'] = @masked_card_number unless @masked_card_number.nil?
        hash['paymentProcessingToken'] = @payment_processing_token unless @payment_processing_token.nil?
        hash['reportingToken'] = @reporting_token unless @reporting_token.nil?
        hash['cardAuthorizationId'] = @card_authorization_id unless @card_authorization_id.nil?
        hash
      end
    end

    # @param hash [Hash]
    def from_hash(hash)
      @masked_card_number = hash['maskedCardNumber'] if hash.key? 'maskedCardNumber'
      @payment_processing_token = hash['paymentProcessingToken'] if hash.key? 'paymentProcessingToken'
      @reporting_token = hash['reportingToken'] if hash.key? 'reportingToken'
      @card_authorization_id = hash['cardAuthorizationId'] if hash.key? 'cardAuthorizationId'
    end
  end
end
