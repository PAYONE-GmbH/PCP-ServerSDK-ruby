require_relative 'model_base'

module PCPServerSDK
  module Models
    class CapturePaymentRequest < ModelBase
      # Here you can specify the amount that you want to capture (specified in cents, where single digit currencies
      # are presumed to have 2 digits). The amount can be lower than the amount that was authorized, but not higher.
      # If left empty, the full amount will be captured and the request will be final.
      # If the full amount is captured, the request will also be final.
      attribute :amount, :amount, :Integer
      # This property indicates whether this will be the final operation.
      # If the full amount should not captured but the property is set to true, the remaining amount will automatically be cancelled.
      attribute :is_final, :isFinal, :Boolean, default: false
      attribute :cancellation_reason, :cancellationReason, :CancellationReason
      attribute :references, :references, :PaymentReferences
      attribute :delivery, :delivery, :DeliveryInformation
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
