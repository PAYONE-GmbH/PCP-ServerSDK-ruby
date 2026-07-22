require_relative 'model_base'

module PCPServerSDK
  module Models
    class RedirectPaymentMethodSpecificOutputForIntent < ModelBase
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :payment_product840_specific_output, :paymentProduct840SpecificOutput, :PaymentProduct840SpecificOutputForIntent
    end
  end
end
