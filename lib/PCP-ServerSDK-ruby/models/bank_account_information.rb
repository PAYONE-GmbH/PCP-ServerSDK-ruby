require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing information about the end customer's bank account.
    class BankAccountInformation < PCPServerSDK::ApiModel
      # IBAN of the end customer's bank account. The IBAN is the International Bank Account Number. It is an internationally agreed format for the BBAN and includes the ISO country code and two check digits.
      # @return [String, nil]
      attr_accessor :iban

      # Account holder of the bank account with the given IBAN. Does not necessarily have to be the end customer (e.g. joint accounts).
      # @return [String, nil]
      attr_accessor :account_holder

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            iban == o.iban &&
            account_holder == o.account_holder
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [iban, account_holder].hash
      end

      def to_hash
        hash = {}
        hash['iban'] = @iban unless @iban.nil?
        hash['accountHolder'] = @iban unless @iban.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @iban = hash['iban'] if hash.key? 'iban'
        @account_holder = hash['accountHolder'] if hash.key? 'accountHolder'
      end
    end
  end
end
