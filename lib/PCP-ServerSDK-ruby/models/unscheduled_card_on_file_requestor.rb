require 'PCP-ServerSDK-ruby/api_enum'

module PCPServerSDK
  module Models
    class UnscheduledCardOnFileRequestor < PCPServerSDK::ApiEnum
      MERCHANT_INITIATED = "merchantInitiated".freeze
      CARDHOLDER_INITIATED = "cardholderInitiated".freeze
    end
  end
end
