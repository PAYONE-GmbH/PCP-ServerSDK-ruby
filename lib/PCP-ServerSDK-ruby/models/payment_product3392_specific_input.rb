require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing specific information for PAYONE Secured Direct. Debit.
    class PaymentProduct3392SpecificInput < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::BankAccountInformation, nil]
      attr_accessor :bank_account_information

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            bank_account_information == o.bank_account_information
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [bank_account_information].hash
      end

      def to_hash
        hash = {}
        hash['bankAccountInformation'] = @bank_account_information.to_hash unless @bank_account_information.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'bankAccountInformation'
          @bank_account_information = BankAccountInformation.new_from_hash(hash['bankAccountInformation'])
        end
      end
    end
  end
end
