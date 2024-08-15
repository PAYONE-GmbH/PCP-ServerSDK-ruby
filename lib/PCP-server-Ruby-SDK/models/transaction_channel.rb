require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    class TransactionChannel < PCPServerSDK::ApiEnum
      ECOMMERCE = "ECOMMERCE".freeze
      MOTO = "MOTO".freeze
    end
  end
end
