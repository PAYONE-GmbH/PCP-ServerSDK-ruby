require_relative 'model_base'

module PCPServerSDK
  module Models
    class RefundPaymentResponse < ModelBase
      attribute :refund_output, :refundOutput, :RefundOutput
      attribute :status, :status, :StatusValue
      attribute :status_output, :statusOutput, :PaymentStatusOutput
      attribute :fund_split, :fundSplit, :FundSplit
      # Unique payment transaction identifier of the payment gateway.
      attribute :id, :id, :String
    end
  end
end
