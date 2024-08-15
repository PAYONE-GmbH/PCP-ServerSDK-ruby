require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Request to refund a payment for a Checkout. It is possible to perform multiple partial refunds by providing an amount that is lower than the total captured amount. The returnReason can be provided for reporting and reconciliation purposes but is not mandatory.
    class RefundRequest < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # @return [PCPServerSDK::Models::PaymentReferences, nil]
      attr_accessor :references

      # @return [PCPServerSDK::Models::ReturnInformation, nil]
      attr_accessor :return

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount_of_money == o.amount_of_money &&
            references == o.references &&
            _return == o._return
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [amount_of_money, references, _return].hash
      end

      def to_hash
        hash = {}
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['return'] = @return.to_hash unless @return.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_has(hash['amountOfMoney'])
        end

        if hash.key? 'references'
          @references = PaymentReferences.new_from_hash(hash['references'])
        end
        if hash.key? 'return'
          @return = ReturnInformation.new_from_hash(hash['return'])
        end
      end
    end
  end
end
