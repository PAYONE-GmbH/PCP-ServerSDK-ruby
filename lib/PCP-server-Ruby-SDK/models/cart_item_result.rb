require_relative 'model_base'

module PCPServerSDK
  module Models
    class CartItemResult < ModelBase
      attribute :invoice_data, :invoiceData, :CartItemInvoiceData
      attribute :order_line_details, :orderLineDetails, :OrderLineDetailsResult
      attribute :supplier_references, :supplierReferences, :CartItemSupplierReferences
    end
  end
end
