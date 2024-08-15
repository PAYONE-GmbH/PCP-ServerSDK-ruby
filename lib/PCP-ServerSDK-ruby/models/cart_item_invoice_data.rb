require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing the line items of the invoice or shopping cart.
    class CartItemInvoiceData < PCPServerSDK::ApiModel
      # Shopping cart item description. The description will also be displayed in the portal as the product name.
      # @return [String, nil]
      attr_accessor :description

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            description == o.description
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [description].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['description'] = @description unless @description.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @description = hash['description'] if hash.key? 'description'
      end
    end
  end
end
