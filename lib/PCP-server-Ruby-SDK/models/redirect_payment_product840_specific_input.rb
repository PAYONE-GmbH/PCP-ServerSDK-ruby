require_relative 'redirect_payment_product840_specific_input_data'

module PCPServerSDK
  module Models
    class RedirectPaymentProduct840SpecificInput < RedirectPaymentProduct840SpecificInputData
      attribute :fraud_net_id, :fraudNetId, :String
      attribute :payment_id, :paymentId, :String

      def self.openapi_all_of
        [:RedirectPaymentProduct840SpecificInputData]
      end
    end
  end
end
