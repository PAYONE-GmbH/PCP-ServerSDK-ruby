require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # An existing shopping cart of a Checkout will not be overwritten with the Patch request. New items can be added to the shoppingCart by providing them in the request. To change existing items (delete, modify or add), the respective itemId must be provided. An item can be completely removed if quantity = 0 is provided.  The price of an item can be changed as long as no payment has happened for this item (i.e. as long as an item has no specific status). Items with a status can no longer be removed entirely, however the quantity can be increased or decreased (for items without payment) by using the itemId.  If no amountOfMoney for the Checkout is provided, the platform will calculate the respective amount based on the cartItem productPrice and productQuantity.
    class PatchCheckoutRequest < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # @return [PCPServerSDK::Models::CheckoutReferences, nil]
      attr_accessor :references

      # @return [PCPServerSDK::Models::Shipping, nil]
      attr_accessor :shipping

      # @return [PCPServerSDK::Models::ShoppingCartPatch, nil]
      attr_accessor :shopping_cart

      # @return [PCPServerSDK::Models::PaymentMethodSpecificInput, nil]
      attr_accessor :payment_method_specific_input

      # @return [PCPServerSDK::Models::References, nil]
      attr_accessor :payment_references

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount_of_money == o.amount_of_money &&
            references == o.references &&
            shipping == o.shipping &&
            shopping_cart == o.shopping_cart &&
            payment_method_specific_input == o.payment_method_specific_input &&
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
        [amount_of_money, references, shipping, shopping_cart, payment_method_specific_input, payment_references].hash
      end

      def to_hash
        hash = {}
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['shipping'] = @shipping.to_hash unless @shipping.nil?
        hash['shoppingCart'] = @shopping_cart.to_hash unless @shopping_cart.nil?
        hash['paymentMethodSpecificInput'] = @payment_method_specific_input.to_hash unless @payment_method_specific_input.nil?
        hash['paymentReferences'] = @payment_references.to_hash unless @payment_references.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'references'
          @references = CheckoutReferences.new_from_hash(hash['references'])
        end
        if hash.key? 'shipping'
          @shipping = Shipping.new_from_hash(hash['shipping'])
        end
        if hash.key? 'shoppingCart'
          @shopping_cart = ShoppingCartPatch.new_from_hash(hash['shoppingCart'])
        end
        if hash.key? 'paymentMethodSpecificInput'
          @payment_method_specific_input = PaymentMethodSpecificInput.new_from_hash(hash['paymentMethodSpecificInput'])
        end
        if hash.key? 'paymentReferences'
          @payment_references = References.new_from_hash(hash['paymentReferences'])
        end
      end
    end
  end
end
