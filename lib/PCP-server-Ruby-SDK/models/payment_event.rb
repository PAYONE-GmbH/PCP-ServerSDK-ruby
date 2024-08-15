require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Detailed information regarding an occurred payment event.
    class PaymentEvent < PCPServerSDK::ApiModel
      # Should be one of the string constants provided by {PCPServerSDK::Models::PaymentType}
      # @return [String, nil]
      attr_accessor :type

      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # Should be one of the string constants provided by {PCPServerSDK::Models::StatusValue}
      # @return [String, nil]
      attr_accessor :payment_status

      # Should be one of the string constants provided by {PCPServerSDK::Models::CancellationReason}
      # @return [String, nil]
      attr_accessor :cancellation_reason

      # Reason of the Refund (e.g. communicated by or to the costumer).
      # @return [String, nil]
      attr_accessor :return_reason

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            type == o.type &&
            amount_of_money == o.amount_of_money &&
            payment_status == o.payment_status &&
            cancellation_reason == o.cancellation_reason &&
            return_reason == o.return_reason
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [type, amount_of_money, payment_status, cancellation_reason, return_reason].hash
      end

      def to_hash
        hash = {}
        hash['type'] = @type unless @type.nil?
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['paymentStatus'] = @payment_status unless @payment_status.nil?
        hash['cancellationReason'] = @cancellation_reason unless @cancellation_reason.nil?
        hash['returnReason'] = @return_reason unless @return_reason.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'type'
          @type = PaymentType.validate(hash['type'])
        end
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'paymentStatus'
          @payment_status = PaymentStatus.validate(hash['paymentStatus'])
        end
        if hash.key? 'cancellationReason'
          @cancellation_reason = CancellationReason.validate(hash['cancellationReason'])
        end
        @return_reason = hash['returnReason'] if hash.key? 'returnReason'
      end
    end
  end
end
