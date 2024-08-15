require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing data related to recurring.
    class CardRecurrenceDetails < PCPServerSDK::ApiModel
      # - first = This transaction is the first of a series of recurring transactions
      # - recurring = This transaction is a subsequent transaction in a series of recurring transactions  Note: For any first of a recurring the system will automatically create a token as you will need to use a token for any subsequent recurring transactions. In case a token already exists this is indicated in the response with a value of False for the isNewToken property in the response.
      # @return [String, nil]
      attr_accessor :recurring_payment_sequence_indicator

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            recurring_payment_sequence_indicator == o.recurring_payment_sequence_indicator
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [recurring_payment_sequence_indicator].hash
      end

      def to_hash
        hash = {}
        hash['recurringPaymentSequenceIndicator'] = @recurring_payment_sequence_indicator unless @recurring_payment_sequence_indicator.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @recurring_payment_sequence_indicator = hash['recurringPaymentSequenceIndicator'] if hash.key? 'recurringPaymentSequenceIndicator'
      end
    end
  end
end
