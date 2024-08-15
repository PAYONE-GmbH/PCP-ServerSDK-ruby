require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing the relevant information of a SEPA Direct Debit mandate for processing (mandatory fields in pain.008). Renamed from CreateMandateWithReturnUrl to ProcessingMandateInformation.
    class ProcessingMandateInformation < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::BankAccountInformation, nil]
      attr_accessor :bank_account_iban

      # Should be one of the string constants provided by {PCPServerSDK::Models::MandateRecurrenceType}
      # @return [String, nil]
      attr_accessor :recurrence_type

      # The unique identifier of the mandate
      # @return [String, nil]
      attr_accessor :unique_mandate_reference

      # The date of signature of the mandate. Format YYYYMMDD
      # @return [String, nil]
      attr_accessor :date_of_signature

      # Your unique creditor identifier.
      # @return [String, nil]
      attr_accessor :creditor_id

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            bank_account_iban == o.bank_account_iban &&
            recurrence_type == o.recurrence_type &&
            unique_mandate_reference == o.unique_mandate_reference &&
            date_of_signature == o.date_of_signature &&
            creditor_id == o.creditor_id
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [bank_account_iban, recurrence_type, unique_mandate_reference, date_of_signature, creditor_id].hash
      end

      def to_hash
        hash = {}
        hash['bankAccountIban'] = @bank_account_iban.to_hash unless @bank_account_iban.nil?
        hash['recurrenceType'] = @recurrence_type unless @recurrence_type.nil?
        hash['uniqueMandateReference'] = @unique_mandate_reference unless @unique_mandate_reference.nil?
        hash['dateOfSignature'] = @date_of_signature unless @date_of_signature.nil?
        hash['creditorId'] = @creditor_id unless @creditor_id.nil?
        hash
      end

      # @return hash [Hash]
      def from_hash(hash)
        if hash.key? 'bankAccountIban'
          @bank_account_iban = BankAccountInformation.new_from_hash(hash['bankAccountIban'])
        end
        if hash.key? 'recurrenceType'
          @recurrence_type = MandateRecurrenceType.validate(hash['recurrenceType'])
        end
        @unique_mandate_reference = hash['uniqueMandateReference'] if hash.key? 'uniqueMandateReference'
        @date_of_signature = hash['dateOfSignature'] if hash.key? 'dateOfSignature'
        @creditor_id = hash['creditorId'] if hash.key? 'creditorId'
      end
    end
  end
end
