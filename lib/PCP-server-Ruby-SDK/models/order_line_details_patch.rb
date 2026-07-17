require_relative 'order_line_details_input'

module PCPServerSDK
  module Models
    class OrderLineDetailsPatch < OrderLineDetailsInput
      # Unique identifier of a cart item
      attribute :id, :id, :String
      attribute :status, :status, "Array<CartItemOrderStatus>"

      def self.openapi_all_of
        [:OrderLineDetailsInput]
      end
    end
  end
end
