require_relative 'model_base'

module PCPServerSDK
  module Models
    class DeliverRequest < ModelBase
      attribute :deliver_type, :deliverType, :DeliverType
      # This property indicates whether this will be the final operation.
      # For deliverType FULL, it is always the final operation.
      # If deliverType PARTIAL is provided and the property is set to true, the remaining amount of the items will be cancelled and the items are marked as CANCELLED.
      attribute :is_final, :isFinal, :Boolean, default: false
      attribute :cancellation_reason, :cancellationReason, :CancellationReason
      attribute :deliver_items, :deliverItems, "Array<DeliverItem>"
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
