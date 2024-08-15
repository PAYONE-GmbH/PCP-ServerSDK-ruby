require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    class AllowedPaymentActions < PCPServerSDK::ApiEnum
      ORDER_MANAGEMENT = "ORDER_MANAGEMENT".freeze
      PAYMENT_EXECUTION = "PAYMENT_EXECUTION".freeze
    end
  end
end
