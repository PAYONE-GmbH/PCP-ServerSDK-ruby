require_relative 'model_base'

module PCPServerSDK
  module Models
    class ProcessingMandateInformation < ModelBase
      attribute :bank_account_iban, :bankAccountIban, :BankAccountInformation
      attribute :recurrence_type, :recurrenceType, :MandateRecurrenceType
      # The unique identifier of the mandate
      attribute :unique_mandate_reference, :uniqueMandateReference, :String
      # The date of signature of the mandate.
      # Format YYYYMMDD
      attribute :date_of_signature, :dateOfSignature, :String
      # Your unique creditor identifier.
      attribute :creditor_id, :creditorId, :String
    end
  end
end
