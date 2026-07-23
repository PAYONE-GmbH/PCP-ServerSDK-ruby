require_relative 'payment_product840_specific_output_data'

module PCPServerSDK
  module Models
    class PaymentProduct840SpecificOutput < PaymentProduct840SpecificOutputData
      attribute :shipping_address, :shippingAddress, :Address

      def self.openapi_all_of
        [:PaymentProduct840SpecificOutputData]
      end
    end
  end
end
