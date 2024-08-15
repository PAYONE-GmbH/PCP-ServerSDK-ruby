require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Order object containing order related data Please note that this object is required to be able to submit the amount.
    class Order < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AmountOfMoney, nil]
      attr_accessor :amount_of_money

      # @return [PCPServerSDK::Models::Customer, nil]
      attr_accessor :customer

      # @return [PCPServerSDK::Models::References]
      attr_accessor :references

      # @return [PCPServerSDK::Models::Shipping, nil]
      attr_accessor :shipping

      # @return [PCPServerSDK::Models::ShoppingCartInput, nil]
      attr_accessor :shopping_cart

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            amount_of_money == o.amount_of_money &&
            customer == o.customer &&
            references == o.references &&
            shipping == o.shipping &&
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
        [amount_of_money, customer, references, shipping, shopping_cart].hash
      end

      def to_hash
        hash = {}
        hash['amountOfMoney'] = @amount_of_money.to_hash unless @amount_of_money.nil?
        hash['customer'] = @customer.to_hash unless @customer.nil?
        hash['references'] = @references.to_hash unless @references.nil?
        hash['shipping'] = @shipping.to_hash unless @shipping.nil?
        hash['shoppingCart'] = @shopping_cart.to_hash unless @shopping_cart.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'amountOfMoney'
          @amount_of_money = AmountOfMoney.new_from_hash(hash['amountOfMoney'])
        end
        if hash.key? 'customer'
          @customer = Customer.new_from_hash(hash['customer'])
        end
        if hash.key? 'references'
          @references = References.new_from_hash(hash['references'])
        end
        if hash.key? 'shipping'
          @shipping = Shipping.new_from_hash(hash['shipping'])
        end
        if hash.key? 'shoppingCart'
          @shopping_cart = ShoppingCartInput.new_from_hash(hash['shoppingCart'])
        end
      end
    end
  end
end
