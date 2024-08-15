require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing the specific input details for card payments.
    class CardPaymentMethodSpecificInput < PCPServerSDK::ApiModel
      # Should be one of the string constants provided by {PCPServerSDK::Models::AuthorizationMode}
      # @return [String, nil]
      attr_accessor :authorization_mode

      # @return [PCPServerSDK::Models::CardRecurrenceDetails, nil]
      attr_accessor :recurring

      # ID of the token to use to create the payment.
      # @return [String, nil]
      attr_accessor :payment_processing_token

      # Token to identify the card in the reporting.
      # @return [String, nil]
      attr_accessor :reporting_token

      # Should be one of the string constants provided by {PCPServerSDK::Models::TransactionChannel}
      # @return [String, nil]
      attr_accessor :transaction_channel

      # Should be one of the string constants provided by PCPServerSDK::Models::UnscheduledCardOnFileRequestor
      # @return [String, nil]
      attr_accessor :unscheduled_card_on_file_requestor

      # Should be one of the string constants provided by PCPServerSDK::Models::UnscheduledCardOnFileSequenceIndicator
      # @return [String, nil]
      attr_accessor :unscheduled_card_on_file_sequence_indicator

      # Payment product identifier - please check product documentation for a full overview of possible values.
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # @return [PCPServerSDK::Models::CardInfo, nil]
      attr_accessor :card

      # The URL that the customer is redirect to after the payment flow has finished. You can add any number of key value pairs in the query string that, for instance help you to identify the customer when they return to your site. Please note that we will also append some additional key value pairs that will also help you with this identification process. Note: The provided URL should be absolute and contain the protocol to use, e.g. http:// or https://. For use on mobile devices a custom protocol can be used in the form of protocol://. This protocol must be registered on the device first. URLs without a protocol will be rejected.
      # @return [String, nil]
      attr_accessor :return_url

      # Period of payment occurrence for recurring and installment payments. Allowed values: * Yearly * Quarterly * Monthly  * Weekly * Daily Supported soon
      # Should be one of the string constants provided by {PCPServerSDK::Models::CardOnFileRecurringFrequency}
      # @return [String, nil]
      attr_accessor :card_on_file_recurring_frequency

      # The end date of the last scheduled payment in a series of transactions. Format YYYYMMDD Supported soon
      # @return [String, nil]
      attr_accessor :card_on_file_recurring_expiration

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            authorization_mode == o.authorization_mode &&
            recurring == o.recurring &&
            payment_processing_token == o.payment_processing_token &&
            reporting_token == o.reporting_token &&
            transaction_channel == o.transaction_channel &&
            unscheduled_card_on_file_requestor == o.unscheduled_card_on_file_requestor &&
            unscheduled_card_on_file_sequence_indicator == o.unscheduled_card_on_file_sequence_indicator &&
            payment_product_id == o.payment_product_id &&
            card == o.card &&
            return_url == o.return_url &&
            card_on_file_recurring_frequency == o.card_on_file_recurring_frequency &&
            card_on_file_recurring_expiration == o.card_on_file_recurring_expiration
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [authorization_mode, recurring, payment_processing_token, reporting_token, transaction_channel, unscheduled_card_on_file_requestor, unscheduled_card_on_file_sequence_indicator, payment_product_id, card, return_url, card_on_file_recurring_frequency, card_on_file_recurring_expiration].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['authorizationMode'] = authorization_mode unless authorization_mode.nil?
        hash['recurring'] = recurring.to_hash unless recurring.nil?
        hash['paymentProcessingToken'] = payment_processing_token unless payment_processing_token.nil?
        hash['reportingToken'] = reporting_token unless reporting_token.nil?
        hash['transactionChannel'] = transaction_channel unless transaction_channel.nil?
        hash['unscheduledCardOnFileRequestor'] = unscheduled_card_on_file_requestor unless unscheduled_card_on_file_requestor.nil?
        hash['unscheduledCardOnFileSequenceIndicator'] = unscheduled_card_on_file_sequence_indicator unless unscheduled_card_on_file_sequence_indicator.nil?
        hash['paymentProductId'] = payment_product_id unless payment_product_id.nil?
        hash['card'] = card.to_hash unless card.nil?
        hash['returnUrl'] = return_url unless return_url.nil?
        hash['cardOnFileRecurringFrequency'] = card_on_file_recurring_frequency unless card_on_file_recurring_frequency.nil?
        hash['cardOnFileRecurringExpiration'] = card_on_file_recurring_expiration unless card_on_file_recurring_expiration.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'authorizationMode'
          @authorization_mode = AuthorizationMode.validate(hash['authorizationMode'])
        end
        if hash.key? 'recurring'
          @recurring = CardRecurrenceDetails.new_from_hash(hash['recurring'])
        end
        @payment_processing_token = hash['paymentProcessingToken'] if hash.key? 'paymentProcessingToken'
        @reporting_token = hash['reportingToken'] if hash.key? 'reportingToken'
        if hash.key? 'transactionChannel'
          @transaction_channel = TransactionChannel.validate(hash['transactionChannel'])
        end
        if hash.key? 'unscheduledCardOnFileRequestor'
          @unscheduled_card_on_file_requestor = UnscheduledCardOnFileRequestor.validate(hash['unscheduledCardOnFileRequestor'])
        end
        if hash.key? 'unscheduledCardOnFileSequenceIndicator'
          @unscheduled_card_on_file_sequence_indicator = UnscheduledCardOnFileSequenceIndicator.validate(hash['unscheduledCardOnFileSequenceIndicator'])
        end
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        if hash.key? 'card'
          @card = CardInfo.new_from_hash(hash['card'])
        end
        @return_url = hash['returnUrl'] if hash.key? 'returnUrl'
        if hash.key? 'cardOnFileRecurringFrequency'
          @card_on_file_recurring_frequency = CardOnFileRecurringFrequency.validate(hash['cardOnFileRecurringFrequency'])
        end
        @card_on_file_recurring_expiration = hash['cardOnFileRecurringExpiration'] if hash.key? 'cardOnFileRecurringExpiration'
      end
    end
  end
end
