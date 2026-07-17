require_relative 'model_base'

module PCPServerSDK
  module Models
    class Payee < ModelBase
      # IBAN of the payee's or beneficiary's bank account. The IBAN is the International Bank Account Number. It is an internationally agreed format for the BBAN and includes the ISO country code and two check digits.
      attribute :iban, :iban, :String
      # Bank Identification Code
      attribute :bic, :bic, :String
      # Name of the payee
      attribute :name, :name, :String
    end
  end
end
