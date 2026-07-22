require_relative 'model_base'

module PCPServerSDK
  module Models
    class CompletePaymentRequest < ModelBase
      attribute :financing_payment_method_specific_input, :financingPaymentMethodSpecificInput, :CompleteFinancingPaymentMethodSpecificInput
      attribute :redirect_payment_method_specific_input, :redirectPaymentMethodSpecificInput, :CompleteRedirectPaymentMethodSpecificInput
      attribute :order, :order, :Order
      attribute :device, :device, :CustomerDevice
    end
  end
end
