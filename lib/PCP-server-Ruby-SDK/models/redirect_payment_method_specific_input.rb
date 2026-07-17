require_relative 'model_base'

module PCPServerSDK
  module Models
    class RedirectPaymentMethodSpecificInput < ModelBase
      attribute :requires_approval, :requiresApproval, :Boolean
      # ID of the token to use to create the payment.
      attribute :payment_processing_token, :paymentProcessingToken, :String
      # Token to identify the card in the reporting.
      attribute :reporting_token, :reportingToken, :String
      # Indicates if this transaction should be tokenized
      # * true - Tokenize the transaction.
      # * false - Do not tokenize the transaction, unless it would be tokenized by other means such as auto-
      # tokenization of recurring payments. example: false
      attribute :tokenize, :tokenize, :Boolean
      attribute :payment_product_id, :paymentProductId, :Integer
      attribute :payment_product840_specific_input, :paymentProduct840SpecificInput, :RedirectPaymentProduct840SpecificInput
      attribute :payment_product900_specific_input, :paymentProduct900SpecificInput, :RedirectPaymentProduct900SpecificInput
      attribute :redirection_data, :redirectionData, :RedirectionData
    end
  end
end
