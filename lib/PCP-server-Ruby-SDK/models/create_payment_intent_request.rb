require_relative 'create_payment_intent'

module PCPServerSDK
  module Models
    class CreatePaymentIntentRequest < CreatePaymentIntent
      attribute :payment_method_specific_input, :paymentMethodSpecificInput, :PaymentMethodSpecificInputForIntent

      def self.openapi_all_of
        [:CreatePaymentIntent]
      end
    end
  end
end
