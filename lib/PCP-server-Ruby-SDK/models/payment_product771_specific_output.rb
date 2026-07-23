require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentProduct771SpecificOutput < ModelBase
      # Unique reference fo a SEPA Mandate
      attribute :mandate_reference, :mandateReference, :String
    end
  end
end
