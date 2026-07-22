require_relative 'model_base'

module PCPServerSDK
  module Models
    class CancelPaymentResponse < ModelBase
      attribute :payment, :payment, :PaymentResponse
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
