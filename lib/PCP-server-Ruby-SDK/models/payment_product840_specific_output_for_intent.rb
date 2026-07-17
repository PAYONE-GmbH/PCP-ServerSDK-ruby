require_relative 'payment_product840_specific_output_data'

module PCPServerSDK
  module Models
    class PaymentProduct840SpecificOutputForIntent < PaymentProduct840SpecificOutputData
      attribute :shipping_address, :shippingAddress, :ShippingAddress

      def self.openapi_all_of
        [:PaymentProduct840SpecificOutputData]
      end
    end
  end
end
