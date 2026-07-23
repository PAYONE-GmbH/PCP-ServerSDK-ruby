require_relative 'cart_item_data'

module PCPServerSDK
  module Models
    class CartItemInput < CartItemData
      attribute :supplier_references, :supplierReferences, :CartItemSupplierReferences

      def self.openapi_all_of
        [:CartItemData]
      end
    end
  end
end
