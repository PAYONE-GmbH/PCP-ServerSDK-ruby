require_relative 'model_base'

module PCPServerSDK
  module Models
    class SepaDirectDebitPaymentMethodSpecificInput < ModelBase
      attribute :payment_product771_specific_input, :paymentProduct771SpecificInput, :SepaDirectDebitPaymentProduct771SpecificInput
      attribute :payment_product_id, :paymentProductId, :Integer
    end
  end
end
