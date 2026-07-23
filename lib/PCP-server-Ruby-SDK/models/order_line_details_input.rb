require_relative 'model_base'

module PCPServerSDK
  module Models
    class OrderLineDetailsInput < ModelBase
      # Product or UPC Code
      attribute :product_code, :productCode, :String
      # The price of one unit of the product, the value should be zero or greater.
      attribute :product_price, :productPrice, :Integer
      attribute :product_type, :productType, :ProductType
      # Quantity of the units being purchased, should be greater than zero
      # Note: Must not be all spaces or all zeros
      attribute :quantity, :quantity, :Integer
      # Tax on the line item, with the last two digits implied as decimal places.
      attribute :tax_amount, :taxAmount, :Integer
      # This field indicates if the `taxAmount` is to be interpreted as the tax amount per unit rather than for the entire line item.
      # This field is included in the response only when `taxAmount` is set; otherwise, it will return as `null`.
      attribute :tax_amount_per_unit, :taxAmountPerUnit, :Boolean, default: false
      # URL of the product in shop.
      #
      # Used for PAYONE Buy Now, Pay Later (BNPL).
      attribute :product_url, :productUrl, :String
      # URL of a product image.
      #
      # Used for PAYONE Buy Now, Pay Later (BNPL).
      attribute :product_image_url, :productImageUrl, :String
      # Category path of the item.
      #
      # Used for PAYONE Buy Now, Pay Later (BNPL).
      attribute :product_category_path, :productCategoryPath, :String
      # Optional parameter to define the delivery shop or touchpoint where an item has been collected (e.g. for
      # Click & Collect or Click & Reserve).
      attribute :merchant_shop_delivery_reference, :merchantShopDeliveryReference, :String
      # The name of the product, will be displayed in Portal if set.
      attribute :product_name, :productName, :String
    end
  end
end
