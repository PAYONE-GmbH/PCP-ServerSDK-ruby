require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Shopping cart data, including items and specific amounts.
    class ShoppingCartResult < PCPServerSDK::ApiModel
      # @return [Array<PCPServerSDK::Models::CartItemResult>, nil]
      attr_accessor :items

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            items == o.items
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [items].hash
      end

      def to_hash
        hash = {}
        hash['items'] = @items.map(&:to_hash) unless @items.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'items'
          @items = CartItemResult.new_from_hash_array(hash['items'])
        end
      end
    end
  end
end
