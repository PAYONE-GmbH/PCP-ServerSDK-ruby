require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentReferences < ModelBase
      # Unique reference of payment transactions, also returned for reporting and reconciliation purposes.
      # For capture requests, providing this value is recommended to support an end-to-end refund flow.
      # If provided for captures or refunds, it must be unique per Checkout.
      attribute :merchant_reference, :merchantReference, :String
    end
  end
end
