require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentProduct3391SpecificInput < ModelBase
      # ID of the selected installment option. Will be provided in the response of the Order / Payment Execution
      # request.
      attribute :installment_option_id, :installmentOptionId, :String
      attribute :bank_account_information, :bankAccountInformation, :BankAccountInformation
    end
  end
end
