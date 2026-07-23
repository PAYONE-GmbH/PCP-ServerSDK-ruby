require_relative 'model_base'

module PCPServerSDK
  module Models
    class CompleteFinancingPaymentMethodSpecificInput < ModelBase
      # Payment product identifier. Currently supported payment methods:
      # * 3391 - PAYONE Secured Installment
      attribute :payment_product_id, :paymentProductId, :Integer
      # * true = the payment requires approval before the funds will be captured using the Approve payment or
      # Capture payment API
      # * false = the payment does not require approval, and the funds will be captured automatically
      #
      # If the parameter is not provided in the request, the default value will be true
      attribute :requires_approval, :requiresApproval, :Boolean, default: true
      attribute :payment_product3391_specific_input, :paymentProduct3391SpecificInput, :PaymentProduct3391SpecificInput
    end
  end
end
