require_relative 'payment_intent_response_data'

module PCPServerSDK
  module Models
    class PaymentIntentResponse < PaymentIntentResponseData
      attribute :redirect_payment_method_specific_output, :redirectPaymentMethodSpecificOutput, :RedirectPaymentMethodSpecificOutputForIntent

      def self.openapi_all_of
        [:PaymentIntentResponseData]
      end
    end
  end
end
