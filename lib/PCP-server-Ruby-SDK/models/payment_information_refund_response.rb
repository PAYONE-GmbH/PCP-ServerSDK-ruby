require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentInformationRefundResponse < ModelBase
      attribute :payment, :payment, :PayoutResponse
      # reference to the paymentExecution.
      attribute :payment_execution_id, :paymentExecutionId, :String
    end
  end
end
