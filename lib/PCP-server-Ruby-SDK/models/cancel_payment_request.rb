require_relative 'model_base'

module PCPServerSDK
  module Models
    class CancelPaymentRequest < ModelBase
      attribute :cancellation_reason, :cancellationReason, :CancellationReason
      # Here you can specify the amount that you want to cancel (specified in cents, where single digit currencies
      # are presumed to have 2 digits). The amount can be lower than the amount that was authorized, but not higher.
      # If left empty, the remaining open amount will be cancelled.
      attribute :amount, :amount, :Integer
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
