require_relative 'model_base'

module PCPServerSDK
  module Models
    class CartItemInvoiceData < ModelBase
      # Shopping cart item description.
      # The description will also be displayed in the portal as the product name if orderLineDetails.productName is not set.
      attribute :description, :description, :String
    end
  end
end
