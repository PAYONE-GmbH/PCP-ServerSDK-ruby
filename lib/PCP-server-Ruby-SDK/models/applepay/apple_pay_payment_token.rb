module PCPServerSDK
  module Models
    class ApplePayPaymentToken
      # @param [PCPServerSDK::Models::ApplePayPaymentData] payment_data
      # @param [PCPServerSDK::Models::ApplePayPaymentMethod] payment_method
      # @param [String] transaction_identifier
      attr_accessor :payment_data, :payment_method, :transaction_identifier
      
      def initialize(payment_data: nil, payment_method: nil, transaction_identifier: nil)
        @payment_data = payment_data
        @payment_method = payment_method
        @transaction_identifier = transaction_identifier
      end
    end
        
  end
end
