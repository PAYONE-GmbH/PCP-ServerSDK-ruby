require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentOutput < ModelBase
      attribute :amount_of_money, :amountOfMoney, :AmountOfMoney
      # It allows you to store additional parameters for the transaction in JSON format. This field should not contain any personal data.
      attribute :merchant_parameters, :merchantParameters, :String
      attribute :references, :references, :PaymentReferences
      attribute :card_payment_method_specific_output, :cardPaymentMethodSpecificOutput, :CardPaymentMethodSpecificOutput
      attribute :mobile_payment_method_specific_output, :mobilePaymentMethodSpecificOutput, :MobilePaymentMethodSpecificOutput
      # Payment method identifier based on the paymentProductId.
      attribute :payment_method, :paymentMethod, :String
      attribute :redirect_payment_method_specific_output, :redirectPaymentMethodSpecificOutput, :RedirectPaymentMethodSpecificOutput
      attribute :sepa_direct_debit_payment_method_specific_output, :sepaDirectDebitPaymentMethodSpecificOutput, :SepaDirectDebitPaymentMethodSpecificOutput
      attribute :financing_payment_method_specific_output, :financingPaymentMethodSpecificOutput, :FinancingPaymentMethodSpecificOutput
    end
  end
end
