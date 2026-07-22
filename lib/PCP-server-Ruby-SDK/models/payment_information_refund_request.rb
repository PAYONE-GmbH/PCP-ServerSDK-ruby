require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentInformationRefundRequest < ModelBase
      attribute :amount_of_money, :amountOfMoney, :PositiveAmountOfMoney
      attribute :references, :references, :PaymentReferences
      # Account holder of the bank account.
      # Does not necessarily have to be the customer (e.g. joint accounts).
      # The name of the account holder is required for payment methods that will use a credit transfer for the refund (e.g. girocard, SEPA Direct Debit)
      attribute :account_holder, :accountHolder, :String
    end
  end
end
