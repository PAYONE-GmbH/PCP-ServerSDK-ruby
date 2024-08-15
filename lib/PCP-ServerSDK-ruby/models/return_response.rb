require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    class ReturnResponse < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::RefundPaymentResponse, nil]
      attr_accessor :return_payment_response

      # @return [PCPServerSDK::Models::ShoppingCartResult, nil]
      attr_accessor :shopping_cart

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            return_payment_response == o.return_payment_response &&
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
        [return_payment_response, shopping_cart].hash
      end

      def to_hash
        hash = {}
        hash['returnPaymentResponse'] = @return_payment_response.to_hash unless @return_payment_response.nil?
        hash['shoppingCart'] = @shopping_cart.to_hash unless @shopping_cart.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'returnPaymentResponse'
          @return_payment_response = ReturnPaymentResponse.new_from_hash(hash['returnPaymentResponse'])
        end
        if hash.key? 'shoppingCart'
          @shopping_cart = ShoppingCartResult.new_from_hash(hash['shoppingCart'])
        end
      end
    end
  end
end
