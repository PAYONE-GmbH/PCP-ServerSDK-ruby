require_relative 'model_base'

module PCPServerSDK
  module Models
    class CompleteRedirectPaymentMethodSpecificInput < ModelBase
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :payment_product840_specific_input, :paymentProduct840SpecificInput, :CompletePaymentProduct840SpecificInput
    end
  end
end
