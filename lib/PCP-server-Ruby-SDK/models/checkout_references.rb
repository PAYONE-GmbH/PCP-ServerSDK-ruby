require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing all details that are linked to the Checkout.
    class CheckoutReferences < PCPServerSDK::ApiModel
      # Unique reference of the Checkout that is also returned for reporting and reconciliation purposes.
      # @return [String, nil]
      attr_accessor :merchant_reference

      # Optional parameter to define the shop or touchpoint where a sale has been realized (e.g. different stores).
      # @return [String, nil]
      attr_accessor :merchant_shop_reference

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            merchant_reference == o.merchant_reference &&
            merchant_shop_reference == o.merchant_shop_reference
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [merchant_reference, merchant_shop_reference].hash
      end

      def to_hash
        hash = {}
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash['merchantShopReference'] = @merchant_shop_reference unless  @merchant_shop_reference.nil?
        hash
      end

      def from_hash(hash)
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
        @merchant_shop_reference = hash['merchantShopReference'] if hash.key? 'merchantShopReference'
      end
    end
  end
end
