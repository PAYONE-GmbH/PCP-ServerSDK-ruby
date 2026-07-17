require_relative 'model_base'

module PCPServerSDK
  module Models
    class FundSplitResponse < ModelBase
      # Unique identifier assigned to the created fund split instruction. This ID can be used for tracking
      # and referencing the fund split in subsequent operations or inquiries.
      attribute :fund_split_id, :fundSplitId, :String
      # Unique identifier of the Payment Execution that this fund split is associated with.
      attribute :payment_execution_id, :paymentExecutionId, :String
      # Unique identifier of the chargeback event that this fund split instruction was created for.
      attribute :event_id, :eventId, :String
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
