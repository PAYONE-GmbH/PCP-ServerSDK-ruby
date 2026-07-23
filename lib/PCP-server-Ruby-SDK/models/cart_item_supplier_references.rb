require_relative 'model_base'

module PCPServerSDK
  module Models
    class CartItemSupplierReferences < ModelBase
      # Unique identifier for the supplier. Used for reporting to identify to which supplier the item belongs.
      # Only allowed for marketplace merchants or if feature to ignore Marketplace fields is enabled in configuration.
      attribute :supplier_id, :supplierId, :String
      # Reference of the order for the supplier.
      attribute :order_reference, :orderReference, :String
    end
  end
end
