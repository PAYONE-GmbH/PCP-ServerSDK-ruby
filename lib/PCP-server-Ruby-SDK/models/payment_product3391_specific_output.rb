require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentProduct3391SpecificOutput < ModelBase
      # List of installment options.
      attribute :installment_options, :installmentOptions, "Array<InstallmentOption>"
    end
  end
end
