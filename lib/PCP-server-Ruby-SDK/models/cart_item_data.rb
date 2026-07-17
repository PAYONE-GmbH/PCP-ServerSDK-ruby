require_relative 'model_base'

module PCPServerSDK
  module Models
    class CartItemData < ModelBase
      attribute :invoice_data, :invoiceData, :CartItemInvoiceData
      attribute :order_line_details, :orderLineDetails, :OrderLineDetailsInput
    end
  end
end
