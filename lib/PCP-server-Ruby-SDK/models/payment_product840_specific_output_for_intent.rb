require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentProduct840SpecificOutputForIntent < ModelBase
      attribute :billing_address, :billingAddress, :Address
      attribute :customer_account, :customerAccount, :PaymentProduct840CustomerAccountForIntent
      attribute :pay_pal_transaction_id, :payPalTransactionId, :String
      attribute :shipping_address, :shippingAddress, :ShippingAddress
    end
  end
end
