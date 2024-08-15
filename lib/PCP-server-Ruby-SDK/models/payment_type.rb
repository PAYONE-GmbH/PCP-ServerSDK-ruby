require 'PCP-server-Ruby-SDK/api_enum'

module PCPServerSDK
  module Models
    class PaymentType < PCPServerSDK::ApiEnum
      SALE = "SALE".freeze
      RESERVATION = "RESERVATION".freeze
      CAPTURE = "CAPTURE".freeze
      REFUND = "REFUND".freeze
      REVERSAL = "REVERSAL".freeze
      CHARGEBACK_REVERSAL = "CHARGEBACK_REVERSAL".freeze
      CREDIT_NOTE = "CREDIT_NOTE".freeze
      DEBIT_NOTE = "DEBIT_NOTE".freeze
    end
  end
end
