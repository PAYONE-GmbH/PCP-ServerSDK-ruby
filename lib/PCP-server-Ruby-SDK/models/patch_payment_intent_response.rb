require_relative 'create_payment_intent_response'

module PCPServerSDK
  module Models
    class PatchPaymentIntentResponse < CreatePaymentIntentResponse
      def self.openapi_all_of
        [:CreatePaymentIntentResponse]
      end
    end
  end
end
