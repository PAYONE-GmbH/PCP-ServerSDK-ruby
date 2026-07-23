require_relative 'model_base'

module PCPServerSDK
  module Models
    class CancelRequest < ModelBase
      attribute :cancel_type, :cancelType, :CancelType
      attribute :cancellation_reason, :cancellationReason, :CancellationReason
      attribute :cancel_items, :cancelItems, "Array<CancelItem>"
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
