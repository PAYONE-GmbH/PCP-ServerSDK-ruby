require_relative 'model_base'

module PCPServerSDK
  module Models
    class SepaDirectDebitPaymentMethodSpecificOutput < ModelBase
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :payment_product771_specific_output, :paymentProduct771SpecificOutput, :PaymentProduct771SpecificOutput
    end
  end
end
