require_relative 'model_base'

module PCPServerSDK
  module Models
    class CaptureOutput < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      # It allows you to store additional parameters for the transaction in JSON format.
      # This field must not contain any personal data.
      attribute :merchant_parameters, :merchantParameters, :String
      attribute :references, :references, :PaymentReferences
      # Payment method identifier used by our payment engine.
      attribute :payment_method, :paymentMethod, :String
      attribute :payment_instructions, :paymentInstructions, :PaymentInstructions
    end
  end
end
