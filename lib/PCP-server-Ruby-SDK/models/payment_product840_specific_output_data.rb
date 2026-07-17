require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentProduct840SpecificOutputData < ModelBase
      attribute :billing_address, :billingAddress, :Address
      attribute :customer_account, :customerAccount, :PaymentProduct840CustomerAccount
      attribute :pay_pal_transaction_id, :payPalTransactionId, :String
    end
  end
end
