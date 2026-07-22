require_relative 'model_base'

module PCPServerSDK
  module Models
    class FinancingPaymentMethodSpecificOutput < ModelBase
      # Payment product identifier - please check product documentation for a full overview of possible values.
      # Currently supported payment methods
      # * 3390 - PAYONE Secured Invoice
      # * 3391 - PAYONE Secured Installment
      # * 3392 - PAYONE Secured Direct Debit
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :payment_product3391_specific_output, :paymentProduct3391SpecificOutput, :PaymentProduct3391SpecificOutput
      attribute :payment_instructions, :paymentInstructions, :PaymentInstructions
    end
  end
end
