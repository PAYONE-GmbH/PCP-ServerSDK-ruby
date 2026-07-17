require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentMethodSpecificInput < ModelBase
      attribute :card_payment_method_specific_input, :cardPaymentMethodSpecificInput, :CardPaymentMethodSpecificInput
      attribute :mobile_payment_method_specific_input, :mobilePaymentMethodSpecificInput, :MobilePaymentMethodSpecificInput
      attribute :redirect_payment_method_specific_input, :redirectPaymentMethodSpecificInput, :RedirectPaymentMethodSpecificInput
      attribute :sepa_direct_debit_payment_method_specific_input, :sepaDirectDebitPaymentMethodSpecificInput, :SepaDirectDebitPaymentMethodSpecificInput
      attribute :financing_payment_method_specific_input, :financingPaymentMethodSpecificInput, :FinancingPaymentMethodSpecificInput
      attribute :customer_device, :customerDevice, :CustomerDevice
      attribute :payment_channel, :paymentChannel, :PaymentChannel
    end
  end
end
