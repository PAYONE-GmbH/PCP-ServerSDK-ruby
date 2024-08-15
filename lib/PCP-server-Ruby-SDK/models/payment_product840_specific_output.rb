require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # PayPal (payment product 840) specific details.
    class PaymentProduct840SpecificOutput < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::Address, nil]
      attr_accessor :billing_address

      # @return [PCPServerSDK::Models::PaymentProduct840CustomerAccount, nil]
      attr_accessor :customer_account

      # @return [PCPServerSDK::Models::Address, nil]
      attr_accessor :shipping_address

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            billing_address == o.billing_address &&
            customer_account == o.customer_account &&
            shipping_address == o.shipping_address
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [billing_address, customer_account, shipping_address].hash
      end

      def to_hash
        hash = {}
        hash['billingAddress'] = @billing_address.to_hash unless @billing_address.nil?
        hash['customerAccount'] = @customer_account.to_hash unless @customer_account.nil?
        hash['shippingAddress'] = @shipping_address.to_hash unless @shipping_address.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'billingAddress'
          @billing_address = Address.new_from_hash(hash['billingAddress'])
        end
        if hash.key? 'customerAccount'
          @customer_account = PaymentProduct840CustomerAccount.new_from_hash(hash['customerAccount'])
        end
        if hash.key? 'shippingAddress'
          @shipping_address = Address.new_from_hash(hash['shippingAddress'])
        end
      end
    end
  end
end
