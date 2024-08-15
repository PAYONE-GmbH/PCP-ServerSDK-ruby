require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # The amount of the paymentSpecificInput might differ from the Checkout amount in case of partial payments but cannot be higher. Additionally, the total amount of the provided shopping cart cannot exceed the Checkout amount.  If a different currency is provided than in the Checkout, the payment execution will be declined. Provided details of the customer and shipping from the Checkout will be automatically loaded and used in the Payment Execution request. The ShoppingCart might differ from the one provided in the Checkout (e.g., for partial payments) and might be required by the payment provider (e.g., BNPL). If the ShoppingCart elements differ from the data provided in the Checkout, the existing data will not be overwritten.
    class PaymentExecutionSpecificInput < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # @return [PCPServerSDK::Models::ShoppingCartInput, nil]
      attr_accessor :shopping_cart

      # @return [PCPServerSDK::Models::References, nil]
      attr_accessor :payment_references

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount_of_money == o.amount_of_money &&
            shopping_cart == o.shopping_cart &&
            payment_references == o.payment_references
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [amount_of_money, shopping_cart, payment_references].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['shoppingCart'] = @shopping_cart.to_hash unless @shopping_cart.nil?
        hash['paymentReferences'] = @payment_references.to_hash unless @payment_references.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'shoppingCart'
          @shopping_cart = ShoppingCartInput.new_from_hash(hash['shoppingCart'])
        end
        if hash.key? 'paymentReferences'
          @payment_references = References.new_from_hash(hash['paymentReferences'])
        end
      end
    end
  end
end
