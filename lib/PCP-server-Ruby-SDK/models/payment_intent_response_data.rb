require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentIntentResponseData < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :references, :references, :PaymentReferences
      attribute :payment_intent_id, :paymentIntentId, :String
      attribute :payment_id, :paymentId, :String
    end
  end
end
