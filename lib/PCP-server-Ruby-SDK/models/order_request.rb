require_relative 'model_base'

module PCPServerSDK
  module Models
    class OrderRequest < ModelBase
      attribute :order_type, :orderType, :OrderType
      attribute :order_references, :orderReferences, :References
      attribute :items, :items, "Array<OrderItem>"
      attribute :payment_method_specific_input, :paymentMethodSpecificInput, :PaymentMethodSpecificInput
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
