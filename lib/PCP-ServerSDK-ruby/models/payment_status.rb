require 'PCP-ServerSDK-ruby/api_enum'
module PCPServerSDK
  module Models
    class PaymentStatus < PCPServerSDK::ApiEnum
      WAITING_FOR_PAYMENT = "WAITING_FOR_PAYMENT".freeze
      PAYMENT_NOT_COMPLETED = "PAYMENT_NOT_COMPLETED".freeze
      PAYMENT_COMPLETED = "PAYMENT_COMPLETED".freeze
      NO_PAYMENT = "NO_PAYMENT".freeze
    end
  end
end
