require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentExecutionRequest < ModelBase
      attribute :payment_method_specific_input, :paymentMethodSpecificInput, :PaymentMethodSpecificInput
      attribute :payment_execution_specific_input, :paymentExecutionSpecificInput, :PaymentExecutionSpecificInput
    end
  end
end
