require_relative 'model_base'

module PCPServerSDK
  module Models
    class RedirectPaymentMethodSpecificOutput < ModelBase
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :payment_product840_specific_output, :paymentProduct840SpecificOutput, :PaymentProduct840SpecificOutput
      # ID of the token. This property is populated when the payment was done with a token.
      attribute :payment_processing_token, :paymentProcessingToken, :String
      # Token to identify the card in the reporting.
      attribute :reporting_token, :reportingToken, :String
    end
  end
end
