require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentCreationOutput < ModelBase
      # The external reference is an identifier for this transaction and can be used for reconciliation purposes.
      attribute :external_reference, :externalReference, :String
    end
  end
end
