require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    # Exemption requested and applied in the authorization.
    class AppliedExemption < PCPServerSDK::ApiEnum
      MERCHANT_INITIATED = "merchantInitiated".freeze
      CARDHOLDER_INITIATED = "cardholderInitiated".freeze
    end
  end
end
