require_relative 'model_base'

module PCPServerSDK
  module Models
    class FundSplit < ModelBase
      attribute :id, :id, :String
      attribute :payment_event_id, :paymentEventId, :String
      attribute :fund_distributions, :fundDistributions, "Array<FundDistribution>"
    end
  end
end
