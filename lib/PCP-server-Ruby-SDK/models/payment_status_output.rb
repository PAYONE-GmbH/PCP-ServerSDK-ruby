require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentStatusOutput < ModelBase
      # Flag indicating if the payment can be cancelled
      attribute :is_cancellable, :isCancellable, :Boolean
      attribute :status_category, :statusCategory, :StatusCategoryValue
      # Indicates if the transaction has been authorized
      attribute :is_authorized, :isAuthorized, :Boolean
      # Flag indicating if the payment can be refunded
      attribute :is_refundable, :isRefundable, :Boolean
    end
  end
end
