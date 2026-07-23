require_relative 'model_base'

module PCPServerSDK
  module Models
    class CompletePaymentMethodSpecificInput < ModelBase
      attribute :payment_product3391_specific_input, :paymentProduct3391SpecificInput, :PaymentProduct3391SpecificInput
      attribute :payment_product840_specific_input, :paymentProduct840SpecificInput, :CompletePaymentProduct840SpecificInput
    end
  end
end
