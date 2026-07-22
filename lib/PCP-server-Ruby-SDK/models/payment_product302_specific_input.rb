require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentProduct302SpecificInput < ModelBase
      # Type of your Apple Pay integration.
      # * MERCHANT_CERTIFICATE - using your own certificate (paid apple pay account needed)
      # * MASS_ENABLEMENT - using PAYONE certificate
      attribute :integration_type, :integrationType, :String, enum: ["MERCHANT_CERTIFICATE", "MASS_ENABLEMENT"]
      attribute :network, :network, :MobilePaymentNetwork
      attribute :token, :token, :ApplePaymentDataTokenInformation
      # Domain of your Webshop. Needed for initialization of the Apple Pay payment session with integrationType=MASS_ENABLEMENT.
      attribute :domain_name, :domainName, :String
      # Name of your Store. Needed for initialization of the Apple Pay payment session with integrationType=MASS_ENABLEMENT.
      attribute :display_name, :displayName, :String
    end
  end
end
