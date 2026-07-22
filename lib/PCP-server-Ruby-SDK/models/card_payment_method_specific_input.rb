require_relative 'model_base'

module PCPServerSDK
  module Models
    class CardPaymentMethodSpecificInput < ModelBase
      attribute :authorization_mode, :authorizationMode, :AuthorizationMode
      attribute :recurring, :recurring, :CardRecurrenceDetails
      # ID of the token to use to create the payment.
      attribute :payment_processing_token, :paymentProcessingToken, :String
      # Token to identify the card in the reporting.
      attribute :reporting_token, :reportingToken, :String
      attribute :transaction_channel, :transactionChannel, :TransactionChannel
      attribute :unscheduled_card_on_file_requestor, :unscheduledCardOnFileRequestor, :UnscheduledCardOnFileRequestor
      attribute :unscheduled_card_on_file_sequence_indicator, :unscheduledCardOnFileSequenceIndicator, :UnscheduledCardOnFileSequenceIndicator
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :card, :card, :CardInfo
      # The URL that the customer is redirect to after the payment flow has finished. You can add any number of key
      # value pairs in the query string that, for instance help you to identify the customer when they return to
      # your site. Please note that we will also append some additional key value pairs that will also help you with
      # this identification process.
      # Note: The provided URL should be absolute and contain the protocol to use, e.g. http:// or https://. For use
      # on mobile devices a custom protocol can be used in the form of protocol://. This protocol must be registered
      # on the device first.
      # URLs without a protocol will be rejected.
      attribute :return_url, :returnUrl, :String
      # Period of payment occurrence for recurring and installment payments. Allowed values:
      # * Yearly
      # * Quarterly
      # * Monthly
      #
      # * Weekly
      # * Daily
      # Supported soon
      attribute :card_on_file_recurring_frequency, :cardOnFileRecurringFrequency, :String, enum: ["Yearly", "Quarterly", "Monthly", "Weekly", "Daily"]
      # The end date of the last scheduled payment in a series of transactions.
      # Format YYYYMMDD Supported soon
      attribute :card_on_file_recurring_expiration, :cardOnFileRecurringExpiration, :String
    end
  end
end
