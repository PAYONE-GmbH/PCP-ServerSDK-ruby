require_relative 'model_base'

module PCPServerSDK
  module Models
    class PayoutOutput < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :references, :references, :PaymentReferences
      # Payment method identifier based on the paymentProductId.
      attribute :payment_method, :paymentMethod, :String
    end
  end
end
