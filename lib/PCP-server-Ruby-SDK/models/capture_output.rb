require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing Capture details.
    class CaptureOutput < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # It allows you to store additional parameters for the transaction in JSON format. This field must not contain any personal data.
      # @return [String, nil]
      attr_accessor :merchant_parameters

      # @return [PCPServerSDK::Models::PaymentReferences, nil]
      attr_accessor :references

      # Payment method identifier used by our payment engine.
      # @return [String, nil]
      attr_accessor :payment_method

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount_of_money == o.amount_of_money &&
            merchant_parameters == o.merchant_parameters &&
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
        [amount_of_money, merchant_parameters, references, payment_method].hash
      end

      def to_hash
        hash = {}
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['paymentMethod'] = @payment_method unless @payment_method.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        @merchant_parameters = hash['merchantParameters'] if hash.key? 'merchantParameters'
        if hash.key? 'references'
          @references = PaymentReferences.new_from_hash(hash['references'])
        end
        @payment_method = hash['paymentMethod'] if hash.key? 'paymentMethod'
      end
    end
  end
end
