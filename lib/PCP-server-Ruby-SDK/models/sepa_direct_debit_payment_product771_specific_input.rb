require_relative 'model_base'

module PCPServerSDK
  module Models
    class SepaDirectDebitPaymentProduct771SpecificInput < ModelBase
      # The unique reference of the existing mandate to use in this payment.
      attribute :existing_unique_mandate_reference, :existingUniqueMandateReference, :String
      attribute :mandate, :mandate, :ProcessingMandateInformation
    end
  end
end
