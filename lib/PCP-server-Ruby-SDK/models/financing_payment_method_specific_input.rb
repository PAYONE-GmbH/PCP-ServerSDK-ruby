require_relative 'model_base'

module PCPServerSDK
  module Models
    class FinancingPaymentMethodSpecificInput < ModelBase
      # Payment product identifier - please check product documentation for a full overview of possible values.
      # Currently supported payment methods
      # * 3390 - PAYONE Secured Invoice
      # * 3391 - PAYONE Secured Installment
      # * 3392 - PAYONE Secured Direct Debit
      attribute :payment_product_id, :paymentProductId, :Integer
      # * true = the payment requires approval before the funds will be captured using the Approve payment or
      # Capture payment API
      # * false = the payment does not require approval, and the funds will be captured automatically
      #
      # If the parameter is not provided in the request, the default value will be true
      attribute :requires_approval, :requiresApproval, :Boolean, default: true
      attribute :payment_product3392_specific_input, :paymentProduct3392SpecificInput, :PaymentProduct3392SpecificInput
    end
  end
end
