require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentInformationResponse < ModelBase
      # Unique ID of the Commerce Case.
      attribute :commerce_case_id, :commerceCaseId, :String
      # Unique ID of the Commerce Case.
      attribute :checkout_id, :checkoutId, :String
      # Unique identifier of the customer.
      attribute :merchant_customer_id, :merchantCustomerId, :String
      # Unique ID of the Payment Information.
      attribute :payment_information_id, :paymentInformationId, :String
      attribute :payment_channel, :paymentChannel, :PaymentChannel
      attribute :payment_product_id, :paymentProductId, :Integer
      # Unique identifier of the POS terminal of the payment transaction.
      attribute :terminal_id, :terminalId, :String
      # Unique ID that identifies a store location or transaction point and which refers to the contract number of
      # the merchant accepting the card.
      attribute :card_acceptor_id, :cardAcceptorId, :String
      # Unique reference of the PaymentInformation. In case of card present transactions, the reference from the ECR
      # or terminal will be used. It is always the reference for external transactions.
      # (e.g. card present payments, cash payments or payments processed by other payment providers).
      attribute :merchant_reference, :merchantReference, :String
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
      attribute :card_payment_details, :cardPaymentDetails, :CardPaymentDetails
      attribute :events, :events, "Array<PaymentEvent>"
    end
  end
end
