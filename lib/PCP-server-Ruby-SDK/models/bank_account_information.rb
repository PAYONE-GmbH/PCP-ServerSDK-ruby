require_relative 'model_base'

module PCPServerSDK
  module Models
    class BankAccountInformation < ModelBase
      # IBAN of the end customer's bank account.
      # The IBAN is the International Bank Account Number. It is an internationally agreed format for the BBAN and
      # includes the ISO country code and two check digits.
      attribute :iban, :iban, :String
      # Bank Identification Code
      attribute :bic, :bic, :String
      # Account holder of the bank account with the given IBAN.
      # Does not necessarily have to be the end customer (e.g. joint accounts).
      attribute :account_holder, :accountHolder, :String
    end
  end
end
