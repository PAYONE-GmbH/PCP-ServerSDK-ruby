require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentExecution < ModelBase
      # Unique ID of paymentExecution.
      attribute :payment_execution_id, :paymentExecutionId, :String
      # Unique payment transaction identifier of the payment gateway.
      attribute :payment_id, :paymentId, :String
      attribute :card_payment_method_specific_input, :cardPaymentMethodSpecificInput, :CardPaymentMethodSpecificInput
      attribute :mobile_payment_method_specific_input, :mobilePaymentMethodSpecificInput, :MobilePaymentMethodSpecificInput
      attribute :redirect_payment_method_specific_input, :redirectPaymentMethodSpecificInput, :RedirectPaymentMethodSpecificInput
      attribute :sepa_direct_debit_payment_method_specific_input, :sepaDirectDebitPaymentMethodSpecificInput, :SepaDirectDebitPaymentMethodSpecificInput
      attribute :financing_payment_method_specific_input, :financingPaymentMethodSpecificInput, :FinancingPaymentMethodSpecificInput
      attribute :bank_payout_method_specific_input, :bankPayoutMethodSpecificInput, :BankPayoutMethodSpecificInput
      attribute :payment_channel, :paymentChannel, :PaymentChannel
      attribute :references, :references, :References
      attribute :previous_payment, :previousPayment, :String
      # The date and time when the payment was created.
      #
      # Format will be in one of the following formats:
      # * YYYY-MM-DD'T'HH:mm:ss'Z'
      # * YYYY-MM-DD'T'HH:mm:ss+XX:XX
      # * YYYY-MM-DD'T'HH:mm:ss-XX:XX
      attribute :creation_date_time, :creationDateTime, :Time
      # The date and time when the payment was last updated.
      #
      # Format will be in one of the following formats:
      # * YYYY-MM-DD'T'HH:mm:ss'Z'
      # * YYYY-MM-DD'T'HH:mm:ss+XX:XX
      # * YYYY-MM-DD'T'HH:mm:ss-XX:XX
      attribute :last_updated, :lastUpdated, :Time
      attribute :events, :events, "Array<PaymentEvent>"
      attribute :fund_splits, :fundSplits, "Array<FundSplit>"
    end
  end
end
