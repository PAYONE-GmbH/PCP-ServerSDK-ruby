require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentEvent < ModelBase
      attribute :type, :type, :PaymentType
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :payment_status, :paymentStatus, :StatusValue
      attribute :cancellation_reason, :cancellationReason, :CancellationReason
      # Reason of the Refund (e.g. communicated by or to the costumer).
      attribute :return_reason, :returnReason, :String
      attribute :payment_instructions, :paymentInstructions, :PaymentInstructions
      attribute :payment_event_id, :paymentEventId, :String
      # The date and time when the payment event was created.
      #
      # Format will be in one of the following formats:
      # * YYYY-MM-DD'T'HH:mm:ss'Z'
      # * YYYY-MM-DD'T'HH:mm:ss+XX:XX
      # * YYYY-MM-DD'T'HH:mm:ss-XX:XX
      attribute :creation_date_time, :creationDateTime, :Time
      # Unique reference from the merchant that was used when the event was created (e.g. from the capture request).
      attribute :merchant_reference, :merchantReference, :String
    end
  end
end
