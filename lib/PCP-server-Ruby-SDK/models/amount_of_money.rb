require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing amount and ISO currency code attributes
    class AmountOfMoney < PCPServerSDK::ApiModel
      # Amount in cents and always having 2 decimals
      # @return [Long, nil]
      attr_accessor :amount

      # Three-letter ISO currency code representing the currency for the amount
      # @return [String, nil]
      attr_accessor :currency_code

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount == o.amount &&
            currency_code == o.currency_code
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [amount, currency_code].hash
      end

      def to_hash
        hash = {}
        hash['amount'] = @amount unless @amount.nil?
        hash['currencyCode'] = @currency_code unless @currency_code.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @amount = hash['amount'] if hash.key? 'amount'
        @currency_code = hash['currencyCode'] if hash.key? 'currencyCode'
      end
    end
  end
end
