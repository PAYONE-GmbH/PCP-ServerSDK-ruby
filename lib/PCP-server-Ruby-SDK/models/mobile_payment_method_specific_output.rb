require_relative 'model_base'

module PCPServerSDK
  module Models
    class MobilePaymentMethodSpecificOutput < ModelBase
      # Payment product identifier - please check product documentation for a full overview of possible values.
      attribute :payment_product_id, :paymentProductId, :Integer
      # Card Authorization code as returned by the acquirer
      attribute :authorisation_code, :authorisationCode, :String
      attribute :fraud_results, :fraudResults, :CardFraudResults
      attribute :three_d_secure_results, :threeDSecureResults, :ThreeDSecureResults
      # The card network that was used for a mobile payment method operation
      attribute :network, :network, :String
    end
  end
end
