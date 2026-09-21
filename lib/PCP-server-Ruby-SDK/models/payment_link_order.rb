require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentLinkOrder < ModelBase
      attribute :merchant_reference, :merchantReference, :String
      attribute :amount, :amount, :AmountOfMoney
    end
  end
end
