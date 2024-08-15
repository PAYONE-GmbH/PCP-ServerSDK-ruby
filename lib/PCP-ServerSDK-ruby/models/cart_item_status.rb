require 'PCP-ServerSDK-ruby/api_enum'

module PCPServerSDK
  module Models
    class CartItemStatus < PCPServerSDK::ApiEnum
      ORDERED = "ORDERED".freeze
      DELIVERED = "DELIVERED".freeze
      CANCELLED = "CANCELLED".freeze
      RETURNED = "RETURNED".freeze
      WAITING_FOR_PAYMENT = "WAITING_FOR_PAYMENT".freeze
    end
  end
end
