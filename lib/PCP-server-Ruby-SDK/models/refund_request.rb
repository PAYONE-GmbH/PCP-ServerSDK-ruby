require_relative 'model_base'

module PCPServerSDK
  module Models
    class RefundRequest < ModelBase
      attribute :amount_of_money, :amountOfMoney, :PositiveAmountOfMoney
      attribute :references, :references, :PaymentReferencesForRefund
      attribute :return, :return, :ReturnInformation
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
