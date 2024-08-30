module PCPServerSDK
  module Models
    class ApplePayPaymentMethod
      # @param [String] display_name
      # @param [String] network
      # @param [PCPServerSDK::Models::ApplePayPaymentMethodType] type
      # @param [String] payment_pass
      # @param [PCPServerSDK::Models::ApplePayPaymentContact] billing_contact
      attr_accessor :display_name, :network, :type, :payment_pass, :billing_contact
      
      def initialize(display_name: nil, network: nil, type: nil, payment_pass: nil, billing_contact: nil)
        @display_name = display_name
        @network = network
        @type = type
        @payment_pass = payment_pass
        @billing_contact = billing_contact
      end
    end
        
  end
end
