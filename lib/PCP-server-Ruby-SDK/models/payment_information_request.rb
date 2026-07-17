require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentInformationRequest < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      attribute :type, :type, :PaymentType
      attribute :payment_channel, :paymentChannel, :PaymentChannel
      attribute :payment_product_id, :paymentProductId, :Integer
      # Unique reference of the PaymentInformation. In case of card present transactions, the reference from the ECR
      # or terminal will be used. It is always the reference for external transactions.
      # (e.g. card present payments, cash payments or payments processed by other payment providers).
      attribute :merchant_reference, :merchantReference, :String
    end
  end
end
