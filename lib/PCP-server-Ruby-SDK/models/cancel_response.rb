require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    class CancelResponse < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::CancelPaymentResponse, nil]
      attr_accessor :cancel_payment_response

      # @return [PCPServerSDK::Models::ShoppingCartResult, nil]
      attr_accessor :shopping_cart

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            cancel_payment_response == o.cancel_payment_response &&
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
        [cancel_payment_response, shopping_cart].hash
      end

      def to_hash
        hash = {}
        hash['cancelPaymentResponse'] = @cancel_payment_response.to_hash unless @cancel_payment_response.nil?
        hash['shoppingCart'] = @shoppingCart.to_hash unless @shoppingCart.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'cancelPaymentResponse'
          @cancel_payment_response = CancelPaymentResponse.new_from_hash(hash['cancelPaymentResponse'])
        end
        if hash.key? 'shoppingCart'
          @shopping_cart = ShoppingCartResult.new_from_hash(hash['shoppingCart'])
        end
      end
    end
  end
end
