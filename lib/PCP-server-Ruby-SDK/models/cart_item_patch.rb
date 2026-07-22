require_relative 'model_base'

module PCPServerSDK
  module Models
    class CartItemPatch < ModelBase
      attribute :invoice_data, :invoiceData, :CartItemInvoiceData
      attribute :order_line_details, :orderLineDetails, :OrderLineDetailsPatch
      attribute :supplier_references, :supplierReferences, :CartItemSupplierReferences
    end
  end
end
