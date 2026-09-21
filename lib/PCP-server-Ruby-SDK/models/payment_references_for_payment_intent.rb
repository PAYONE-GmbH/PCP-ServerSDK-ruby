require_relative 'payment_references'

module PCPServerSDK
  module Models
    class PaymentReferencesForPaymentIntent < PaymentReferences
      def self.openapi_all_of
        [:PaymentReferences]
      end
    end
  end
end
