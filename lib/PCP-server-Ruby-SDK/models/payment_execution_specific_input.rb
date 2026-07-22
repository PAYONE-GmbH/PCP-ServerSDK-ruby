require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentExecutionSpecificInput < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :shopping_cart, :shoppingCart, :ShoppingCartInput
      attribute :payment_references, :paymentReferences, :References
      attribute :fund_split, :fundSplit, :FundSplit
    end
  end
end
