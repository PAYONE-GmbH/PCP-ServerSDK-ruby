require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing specific information for PAYONE Secured Installment.
    class PaymentProduct3391SpecificInput < PCPServerSDK::ApiModel
      # ID of the selected installment option. Will be provided in the response of the Order / Payment Execution request.
      # @return [String, nil]
      attr_accessor :installment_option_id

      # @return [PCPServerSDK::Models::BankAccountInformation, nil]
      attr_accessor :bank_account_information

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            installment_option_id == o.installment_option_id &&
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
        [installment_option_id, bank_account_information].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['installmentOptionId'] = @installment_option_id unless @installment_option_id.nil?
        hash['bankAccountInformation'] = @bank_account_information.to_hash unless @bank_account_information.nil?
        hash
      end

      def from_hash(hash)
        @installment_option_id = hash['installmentOptionId'] if hash.key? 'installmentOptionId'
        if hash.key? 'bankAccountInformation'
          @bank_account_information = BankAccountInformation.new_from_hash(hash['bankAccountInformation'])
        end
      end
    end
  end
end
