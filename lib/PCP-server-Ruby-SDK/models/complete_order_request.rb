require_relative 'model_base'

module PCPServerSDK
  module Models
    class CompleteOrderRequest < ModelBase
      attribute :complete_payment_method_specific_input, :completePaymentMethodSpecificInput, :CompletePaymentMethodSpecificInput
    end
  end
end
