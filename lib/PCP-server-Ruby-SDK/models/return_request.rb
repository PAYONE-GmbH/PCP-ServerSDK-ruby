require_relative 'model_base'

module PCPServerSDK
  module Models
    class ReturnRequest < ModelBase
      attribute :return_type, :returnType, :ReturnType
      # Reason of the Refund (e.g. communicated by or to the consumer).
      attribute :return_reason, :returnReason, :String
      attribute :return_items, :returnItems, "Array<ReturnItem>"
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
