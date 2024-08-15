require 'PCP-ServerSDK-ruby/api_enum'

module PCPServerSDK
  module Models
    class AuthorizationMode < PCPServerSDK::ApiEnum
      PRE_AUTHORIZATION = "PRE_AUTHORIZATION".freeze
      SALE = "SALE".freeze
    end
  end
end
