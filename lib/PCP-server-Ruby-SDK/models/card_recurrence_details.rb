require_relative 'model_base'

module PCPServerSDK
  module Models
    class CardRecurrenceDetails < ModelBase
      # * first = This transaction is the first of a series of recurring transactions
      # * recurring = This transaction is a subsequent transaction in a series of recurring transactions
      #
      # For the initial transaction of a recurring payment, the system will automatically generate a token
      # that you will need for all subsequent transactions in the series. If a token has already been created,
      # the response will indicate this with isNewToken set to False.
      #
      # Important: This token generation mechanism is intended for regularly scheduled recurring payments initiated by you.
      # It should not be used in conjunction with UnscheduledCardOnFileRequestor or unscheduledCardOnFileSequenceIndicator.
      attribute :recurring_payment_sequence_indicator, :recurringPaymentSequenceIndicator, :String, enum: ["first", "recurring"]
    end
  end
end
