require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    class StatusCategoryValue < PCPServerSDK::ApiEnum
      CREATED = "CREATED".freeze
      UNSUCCESSFUL = "UNSUCCESSFUL".freeze
      PENDING_PAYMENT = "PENDING_PAYMENT".freeze
      PENDING_MERCHANT = "PENDING_MERCHANT".freeze
      PENDING_CONNECT_OR_3_RD_PARTY = "PENDING_CONNECT_OR_3RD_PARTY".freeze
      COMPLETED = "COMPLETED".freeze
      REVERSED = "REVERSED".freeze
      REFUNDED = "REFUNDED".freeze
    end
  end
end
