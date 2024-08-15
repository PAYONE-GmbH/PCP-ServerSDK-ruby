require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing details from the created payout.
    class PayoutOutput < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # @return [PCPServerSDK::Models::PaymentReferences, nil]
      attr_accessor :references

      # Payment method identifier based on the paymentProductId.
      # @return [String, nil]
      attr_accessor :payment_method

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount_of_money == o.amount_of_money &&
            references == o.references &&
            payment_method == o.payment_method
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [amount_of_money, references, payment_method].hash
      end

      def to_hash
        hash = {}
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'references'
          @references = PaymentReferences.new_from_hash(hash['references'])
        end
        @payment_method = hash['paymentMethod'] if hash.key? 'paymentMethod'
      end
    end
  end
end
