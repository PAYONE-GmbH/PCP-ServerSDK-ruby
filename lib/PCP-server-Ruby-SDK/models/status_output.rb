require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Contains information about whether the payment of the Checkout has already been completed and how much of the total sum has been collected already.
    class StatusOutput < PCPServerSDK::ApiModel
      # Should be one of the string constants provided by {PCPServerSDK::Models::PaymentStatus}
      # @return [String, nil]
      attr_accessor :payment_status
      # Indicates whether the Checkout can still be modified. False if any payment is already in progress, true otherwise.
      # @return [Boolean, nil]
      attr_accessor :is_modifiable

      # Amount in cents always having 2 decimals. The amount yet to be paid.
      # @return [Integer, nil]
      attr_accessor :open_amount

      # Amount in cents always having 2 decimals. The amount that has already been collected.
      # @return [Integer, nil]
      attr_accessor :collected_amount

      # Amount in cents always having 2 decimals. The amount that has already been cancelled.
      # @return [Integer, nil]
      attr_accessor :cancelled_amount

      # Amount in cents always having 2 decimals. Amount that has been collected but was refunded to the customer.
      # @return [Integer, nil]
      attr_accessor :refunded_amount

      # Amount in cents always having 2 decimals. Amount that has been collected but was charged back by the customer.
      # @return [Integer, nil]
      attr_accessor :chargeback_amount

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_status == o.payment_status &&
            is_modifiable == o.is_modifiable &&
            open_amount == o.open_amount &&
            collected_amount == o.collected_amount &&
            cancelled_amount == o.cancelled_amount &&
            refunded_amount == o.refunded_amount &&
            chargeback_amount == o.chargeback_amount
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_status, is_modifiable, open_amount, collected_amount, cancelled_amount, refunded_amount, chargeback_amount].hash
      end

      def to_hash
        hash = {}
        hash['paymentStatus'] = @payment_status unless @payment_status.nil?
        hash['isModifiable'] = @is_modifiable unless @is_modifiable.nil?
        hash['openAmount'] = @open_amount unless @open_amount.nil?
        hash['collectedAmount'] = @collected_amount unless @collected_amount.nil?
        hash['cancelledAmount'] = @cancelled_amount unless @cancelled_amount.nil?
        hash['refundedAmount'] = @refunded_amount unless @refunded_amount.nil?
        hash['chargebackAmount'] = @chargeback_amount unless @chargeback_amount.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'paymentStatus'
          @paymentStatus = PaymentStatus.validate(hash['paymentStatus'])
        end
        @is_modifiable = hash['isModifiable'] if hash.key? 'isModifiable'
        @open_amount = hash['openAmount'] if hash.key? 'openAmount'
        @collected_amount = hash['collectedAmount'] if hash.key? 'collectedAmount'
        @cancelled_amount = hash['cancelledAmount'] if hash.key? 'cancelledAmount'
        @refunded_amount = hash['refundedAmount'] if hash.key? 'refundedAmount'
        @chargeback_amount = hash['chargebackAmount'] if hash.key? 'chargebackAmount'
      end
    end
  end
end
