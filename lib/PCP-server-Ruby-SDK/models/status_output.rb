require_relative 'model_base'

module PCPServerSDK
  module Models
    class StatusOutput < ModelBase
      # * WAITING_FOR_PAYMENT - There does not yet exist a PaymentExecution nor a PaymentInformation for this
      # Checkout.
      # * PAYMENT_NOT_COMPLETED - There exists a PaymentExecution or a PaymentInformation for this Checkout, but all
      # or some part of the total amount is still unpaid.
      # * PAYMENT_COMPLETED - There exists a PaymentExecution or a PaymentInformation for this Checkout and the
      # total amount is fully paid.
      # * NO_PAYMENT - Checkout was created and deleted. No Payment Execution and no other actions can be triggered
      # on the Checkout.
      attribute :payment_status, :paymentStatus, :String, enum: ["WAITING_FOR_PAYMENT", "PAYMENT_NOT_COMPLETED", "PAYMENT_COMPLETED", "NO_PAYMENT"]
      # Indicates whether the Checkout can still be modified. False if any payment is already in progress, true
      # otherwise.
      attribute :is_modifiable, :isModifiable, :Boolean
      # Amount in cents always having 2 decimals. The amount yet to be paid.
      attribute :open_amount, :openAmount, :Integer
      # Amount in cents always having 2 decimals. The amount that has already been collected.
      attribute :collected_amount, :collectedAmount, :Integer
      # Amount in cents always having 2 decimals. The amount that has already been cancelled.
      attribute :cancelled_amount, :cancelledAmount, :Integer
      # Amount in cents always having 2 decimals. Amount that has been collected but was refunded to the customer.
      attribute :refunded_amount, :refundedAmount, :Integer
      # Amount in cents always having 2 decimals. Amount that has been collected but was charged back by the
      # customer.
      attribute :chargeback_amount, :chargebackAmount, :Integer
    end
  end
end
