require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    class ProductType < PCPServerSDK::ApiEnum
      GOODS = "GOODS".freeze
      SHIPMENT = "SHIPMENT".freeze
      HANDLING_FEE = "HANDLING_FEE".freeze
      DISCOUNT = "DISCOUNT".freeze
    end
  end
end
