
module PCPServerSDK
  module Models
    class ApplePayPaymentData
      attr_accessor :data, :header, :signature, :version
    
      # @param [String] data
      # @param [PCPServerSDK::Models::ApplePayPaymentDataHeader] header
      # @param [String] signature
      # @param [String] version
      def initialize(data: nil, header: nil, signature: nil, version: nil)
        @data = data
        @header = header
        @signature = signature
        @version = version
      end
    end
    
          
  end
end
