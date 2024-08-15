require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # This object contains information of all items in the cart. If a cart item is provided, the productPrice and quantity is required.
    class CartItemResult < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::CartItemInvoiceData, nil]
      attr_accessor :invoice_data

      # @return [PCPServerSDK::Models::OrderLineDetailsResult, nil]
      attr_accessor :order_line_details
      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            invoice_data == o.invoice_data &&
            order_line_details == o.order_line_details
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [invoice_data, order_line_details].hash
      end

      def to_hash
        hash = {}
        hash['invoiceData'] = @invoice_data.to_hash unless @invoice_data.nil?
        hash['orderLineDetails'] = @order_line_details.to_hash unless @order_line_details.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        if hash.key? 'invoiceData'
          @invoice_data = CartItemInvoiceData.new_from_hash(hash['invoiceData'])
        end
        if hash.key? 'orderLineDetails'
          @order_line_details = OrderLineDetailsResult.new_from_hash(hash['orderLineDetails'])
        end
      end
    end
  end
end
