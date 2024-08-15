require 'PCP-ServerSDK-ruby/api_enum'

module PCPServerSDK
  module Models
    class ExtendedCheckoutStatus < PCPServerSDK::ApiEnum
      OPEN = "OPEN".freeze
      DELETED = "DELETED".freeze
      PENDING_COMPLETION = "PENDING_COMPLETION".freeze
      COMPLETED = "COMPLETED".freeze
      PARTIALLY_BILLED = "PARTIALLY_BILLED".freeze
      BILLED = "BILLED".freeze
      CHARGEBACKED = "CHARGEBACKED".freeze
      PARTIALLY_REFUNDED = "PARTIALLY_REFUNDED".freeze
      REFUNDED = "REFUNDED".freeze
    end
  end
end
