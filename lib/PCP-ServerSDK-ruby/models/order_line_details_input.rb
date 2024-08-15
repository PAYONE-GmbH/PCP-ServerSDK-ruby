require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing additional information that when supplied can have a beneficial effect on the discountrates.
    class OrderLineDetailsInput < PCPServerSDK::ApiModel
      # Product or UPC Code
      # @return [String, nil]
      attr_accessor :product_code

      # The price of one unit of the product, the value should be zero or greater.
      # @return [Integer, nil]
      attr_accessor :product_price

      # Should be one of the string constants provided by {PCPServerSDK::Models::ProductType}
      # @return [String, nil]
      attr_accessor :product_type

      # Quantity of the units being purchased, should be greater than zero Note: Must not be all spaces or all zeros
      # @return [Integer, nil]
      attr_accessor :quantity

      # Tax on the line item, with the last two digits implied as decimal places
      # @return [Integer, nil]
      attr_accessor :tax_amount

      # URL of the product in shop.   Used for PAYONE Buy Now, Pay Later (BNPL).
      # @return [String, nil]
      attr_accessor :product_url

      # URL of a product image.   Used for PAYONE Buy Now, Pay Later (BNPL).
      # @return [String, nil]
      attr_accessor :product_image_url

      # Category path of the item.   Used for PAYONE Buy Now, Pay Later (BNPL).
      # @return [String, nil]
      attr_accessor :product_category_path

      # Optional parameter to define the delivery shop or touchpoint where an item has been collected (e.g. for Click & Collect or Click & Reserve).
      # @return [String, nil]
      attr_accessor :merchant_shop_delivery_reference

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            product_code == o.product_code &&
            product_price == o.product_price &&
            product_type == o.product_type &&
            quantity == o.quantity &&
            tax_amount == o.tax_amount &&
            product_url == o.product_url &&
            product_image_url == o.product_image_url &&
            product_category_path == o.product_category_path &&
            merchant_shop_delivery_reference == o.merchant_shop_delivery_reference
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [product_code, product_price, product_type, quantity, tax_amount, product_url, product_image_url, product_category_path, merchant_shop_delivery_reference].hash
      end

      def to_hash
        hash = {}
        hash['productCode'] = @product_code unless @product_code.nil?
        hash['productPrice'] = @product_price unless @product_price.nil?
        hash['productType'] = @product_type unless @product_type.nil?
        hash['quantity'] = @quantity unless @quantity.nil?
        hash['taxAmount'] = @tax_amount unless @tax_amount.nil?
        hash['productUrl'] = @product_url unless @product_url.nil?
        hash['productImageUrl'] = @product_image_url unless @product_image_url.nil?
        hash['productCategoryPath'] = @product_category_path unless @product_category_path.nil?
        hash['merchantShopDeliveryReference'] = @merchant_shop_delivery_reference unless @merchant_shop_delivery_reference.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @product_code = hash['productCode'] if hash.key? 'productCode'
        @product_price = hash['productPrice'] if hash.key? 'productPrice'
        if hash.key? 'productType'
          @product_type = ProductType.validate(hash['productType'])
        end
        @quantity = hash['quantity'] if hash.key? 'quantity'
        @tax_amount = hash['taxAmount'] if hash.key? 'taxAmount'
        @product_url = hash['productUrl'] if hash.key? 'productUrl'
        @product_image_url = hash['productImageUrl'] if hash.key? 'productImageUrl'
        @product_category_path = hash['productCategoryPath'] if hash.key? 'productCategoryPath'
        @merchant_shop_delivery_reference = hash['merchantShopDeliveryReference'] if hash.key? 'merchantShopDeliveryReference'
      end
    end
  end
end
