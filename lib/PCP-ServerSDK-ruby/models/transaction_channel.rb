require 'PCP-ServerSDK-ruby/api_enum'

module PCPServerSDK
  module Models
    class TransactionChannel < PCPServerSDK::ApiEnum
      ECOMMERCE = "ECOMMERCE".freeze
      MOTO = "MOTO".freeze
    end
  end
end
