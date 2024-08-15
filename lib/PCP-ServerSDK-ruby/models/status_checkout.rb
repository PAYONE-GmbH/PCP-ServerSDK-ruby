require 'PCP-ServerSDK-ruby/api_enum'

module PCPServerSDK
  module Models
    class StatusCheckout < PCPServerSDK::ApiEnum
      OPEN = "OPEN".freeze
      PENDING_COMPLETION = "PENDING_COMPLETION".freeze
      COMPLETED = "COMPLETED".freeze
      BILLED = "BILLED".freeze
      CHARGEBACKED = "CHARGEBACKED".freeze
      DELETED = "DELETED".freeze
    end
  end
end
