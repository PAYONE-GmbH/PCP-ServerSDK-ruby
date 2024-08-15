require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    class DeliverResponse < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::CapturePaymentResponse, nil
      attr_accessor :capture_payment_response

      # @return [PCPServerSDK::Models::ShoppingCartResult, nil]
      attr_accessor :shopping_cart

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            capture_payment_response == o.capture_payment_response &&
            shopping_cart == o.shopping_cart
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [capture_payment_response, shopping_cart].hash
      end

      def to_hash
        hash = {}
        hash['capturePaymentResponse'] = @capture_payment_response.to_hash unless @capture_payment_response.nil?
        hash['shoppingCart'] = @shopping_cart.to_hash unless @shopping_cart.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'capturePaymentResponse'
          @capture_payment_response = CapturePaymentResponse.new_from_hash(hash['capturePaymentResponse'])
        end
        if hash.key? 'shoppingCart'
          @shopping_cart = ShoppingCartResult.new_from_hash(hash['shoppingCart'])
        end
      end
    end
  end
end
