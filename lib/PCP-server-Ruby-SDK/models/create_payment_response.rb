require_relative 'model_base'

module PCPServerSDK
  module Models
    class CreatePaymentResponse < ModelBase
      attribute :creation_output, :creationOutput, :PaymentCreationOutput
      attribute :merchant_action, :merchantAction, :MerchantAction
      attribute :payment, :payment, :PaymentResponse
      attribute :fund_split, :fundSplit, :FundSplit
      # reference to the paymentExecution.
      attribute :payment_execution_id, :paymentExecutionId, :String
    end
  end
end
