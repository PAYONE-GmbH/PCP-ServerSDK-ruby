require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing specific input required for PayPal payments (Payment product ID 840)
    class RedirectPaymentProduct840SpecificInput < PCPServerSDK::ApiModel
      # Indicates whether to use PayPal Express Checkout Shortcut.
      # - true = When shortcut is enabled, the consumer can select a shipping address during PayPal checkout.
      # - false = When shortcut is disabled, the consumer cannot change the shipping address.
      # Default value is false. Please note that this field is ignored when order.additionalInput.typeInformation.purchaseType is set to \"digital\"
      # @return [Boolean, nil]
      attr_accessor :address_selection_at_pay_pal

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            address_selection_at_pay_pal == o.address_selection_at_pay_pal
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [address_selection_at_pay_pal].hash
      end

      def to_hash
        hash = {}
        hash['addressSelectionAtPayPal'] = @address_selection_at_pay_pal unless @address_selection_at_pay_pal.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @address_selection_at_pay_pal = hash['addressSelectionAtPayPal'] if hash.key? 'addressSelectionAtPayPal'
      end
    end
  end
end
