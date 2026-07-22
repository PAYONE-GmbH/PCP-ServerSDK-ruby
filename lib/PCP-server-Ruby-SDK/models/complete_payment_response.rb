require_relative 'model_base'

module PCPServerSDK
  module Models
    class CompletePaymentResponse < ModelBase
      attribute :creation_output, :creationOutput, :PaymentCreationOutput
      attribute :merchant_action, :merchantAction, :MerchantAction
      attribute :payment, :payment, :PaymentResponse
    end
  end
end
