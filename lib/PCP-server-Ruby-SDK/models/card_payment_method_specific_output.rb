require_relative 'model_base'

module PCPServerSDK
  module Models
    class CardPaymentMethodSpecificOutput < ModelBase
      attribute :payment_product_id, :paymentProductId, :Integer
      # Card Authorization code as returned by the acquirer
      attribute :authorisation_code, :authorisationCode, :String
      attribute :fraud_results, :fraudResults, :CardFraudResults
      attribute :three_d_secure_results, :threeDSecureResults, :ThreeDSecureResults
    end
  end
end
