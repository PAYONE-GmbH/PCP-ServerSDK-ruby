require_relative 'model_base'

module PCPServerSDK
  module Models
    class PaymentResponse < ModelBase
      attribute :payment_output, :paymentOutput, :PaymentOutput
      attribute :status, :status, :StatusValue
      attribute :status_output, :statusOutput, :PaymentStatusOutput
      # Unique payment transaction identifier of the payment gateway.
      attribute :id, :id, :String
    end
  end
end
