require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Reason why an order was cancelled. Possible values:
    # - CONSUMER_REQUEST - The consumer requested a cancellation of the Order
    # - UNDELIVERABLE - The merchant cannot fulfill the Order
    # - DUPLICATE - The Order was created twice accidentally
    # - FRAUDULENT- Consumer turned out to be a fraudster
    # - ORDER_SHIPPED_IN_FULL - The merchant shipped everything and wants to cancel the remaining authorized amount of
    # the Order
    # - AUTOMATED_SHIPMENT_FAILED - A technical error was thrown during an automated shipment API call rendering the
    # Order impossible to complete
    #
    # Mandatory for PAYONE Buy Now, Pay Later (BNPL):
    # - 3390 - PAYONE Secured Invoice
    # - 3391 - PAYONE Secured Installment
    # - 3392 - PAYONE Secured Direct Debit
    class CancellationReason < PCPServerSDK::ApiEnum
      CONSUMER_REQUEST = "CONSUMER_REQUEST".freeze
      UNDELIVERABLE = "UNDELIVERABLE".freeze
      DUPLICATE = "DUPLICATE".freeze
      FRAUDULENT = "FRAUDULENT".freeze
      ORDER_SHIPPED_IN_FULL = "ORDER_SHIPPED_IN_FULL".freeze
      AUTOMATED_SHIPMENT_FAILED = "AUTOMATED_SHIPMENT_FAILED".freeze
    end
  end
end
