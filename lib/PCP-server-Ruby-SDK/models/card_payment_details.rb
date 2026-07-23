require_relative 'model_base'

module PCPServerSDK
  module Models
    class CardPaymentDetails < ModelBase
      # Reference to the card of the transaction.
      attribute :masked_card_number, :maskedCardNumber, :String
      # ID of the token. This property is populated when the payment was done with a token.
      attribute :payment_processing_token, :paymentProcessingToken, :String
      # Token to identify the card in the reporting.
      attribute :reporting_token, :reportingToken, :String
      # Identifier for a successful authorization, reversal or refund.
      # Usually provided by the issuer system. Only provided for card payments.
      attribute :card_authorization_id, :cardAuthorizationId, :String
    end
  end
end
