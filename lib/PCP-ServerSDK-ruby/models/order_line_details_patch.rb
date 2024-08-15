require 'PCP-ServerSDK-ruby/models/order_line_details_input'

module PCPServerSDK
  module Models
    # Object containing additional information that when supplied can have a beneficial effect on the discountrates.
    class OrderLineDetailsPatch < PCPServerSDK::Models::OrderLineDetailsInput
      # Unique identifier of a cart item
      # @return [String, nil]
      attr_accessor :id

      # @return [Array<CartItemOrderStatus>, nil]
      attr_accessor :status

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        super &&
        self.class == o.class &&
            id == o.id &&
            status == o.status
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [id, status, product_code, product_price, product_type, quantity, tax_amount, product_url, product_image_url, product_category_path, merchant_shop_delivery_reference].hash
      end

      def to_hash
        hash = super
        hash['id'] = @id unless @id.nil?
        hash['status'] = @status.map(&:to_hash) unless @status.nil?
        hash
      end

      def from_hash(hash)
        super
        @id = hash['id'] if hash.key? 'id'
        if hash.key? 'status'
          @status = CartItemOrderStatus.new_from_hash_array(hash['status'])
        end
      end
    end
  end
end
