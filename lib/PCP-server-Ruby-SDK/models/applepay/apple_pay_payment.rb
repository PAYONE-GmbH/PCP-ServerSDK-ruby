module PCPServerSDK
  module Models
    class ApplePayPayment
      # @param [PCPServerSDK::Models::ApplePayPaymentToken] token
      # @param [PCPServerSDK::Models::ApplePayPaymentContact] billing_contact
      # @param [PCPServerSDK::Models::ApplePayPaymentContact] shipping_contact
      attr_accessor :token, :billing_contact, :shipping_contact

      JSON_PROPERTY_TOKEN = 'token'.freeze
      JSON_PROPERTY_BILLING_CONTACT = 'billingContact'.freeze
      JSON_PROPERTY_SHIPPING_CONTACT = 'shippingContact'.freeze

      def initialize(token = nil, billing_contact = nil, shipping_contact = nil)
        @token = token
        @billing_contact = billing_contact
        @shipping_contact = shipping_contact
      end

      def token=(token)
        @token = token
      end

      def billing_contact=(billing_contact)
        @billing_contact = billing_contact
      end

      def shipping_contact=(shipping_contact)
        @shipping_contact = shipping_contact
      end

      def ==(other)
        return true if self.equal?(other)
        return false unless other.is_a?(ApplePayPayment)
        token == other.token &&
          billing_contact == other.billing_contact &&
          shipping_contact == other.shipping_contact
      end

      alias eql? ==

      def hash
        [token, billing_contact, shipping_contact].hash
      end

      def to_s
        "class ApplePayPayment {\n" \
          "    token: #{to_indented_string(token)}\n" \
          "    billingContact: #{to_indented_string(billing_contact)}\n" \
          "    shippingContact: #{to_indented_string(shipping_contact)}\n" \
        "}"
      end

      private

        def to_indented_string(value)
          return 'null' if value.nil?

          value.to_s.gsub("\n", "\n    ")
        end
    end
  end
end
