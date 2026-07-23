require_relative 'model_base'

module PCPServerSDK
  module Models
    class InstallmentOption < ModelBase
      # Installment option Identifier. Use this in the Complete Payment for the selected installment option.
      attribute :installment_option_id, :installmentOptionId, :String
      # The number of monthly payments for this installment.
      attribute :number_of_payments, :numberOfPayments, :Integer
      # Monthly rate amount.
      attribute :monthly_amount, :monthlyAmount, :AmountOfMoney
      # Last rate amount.
      attribute :last_rate_amount, :lastRateAmount, :AmountOfMoney
      # Effective interest amount in percent with two decimals.
      attribute :effective_interest_rate, :effectiveInterestRate, :Integer
      # Nominal interest amount in percent with two decimals.
      attribute :nominal_interest_rate, :nominalInterestRate, :Integer
      # Total rate amount.
      attribute :total_amount, :totalAmount, :AmountOfMoney
      # Due date of first rate.
      # Format: YYYYMMDD
      attribute :first_rate_date, :firstRateDate, :String
      # Link with credit information.
      attribute :credit_information, :creditInformation, :LinkInformation
    end
  end
end
