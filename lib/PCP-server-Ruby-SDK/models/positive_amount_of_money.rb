require_relative 'model_base'

module PCPServerSDK
  module Models
    class PositiveAmountOfMoney < ModelBase
      # Amount in cents and always having 2 decimals
      attribute :amount, :amount, :Integer
      # Three-letter ISO currency code representing the currency for the amount
      attribute :currency_code, :currencyCode, :String
    end
  end
end
