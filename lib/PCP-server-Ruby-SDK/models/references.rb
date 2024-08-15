require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object that holds all reference properties that are linked to this transaction.
    class References < PCPServerSDK::ApiModel
      # Descriptive text that is used towards to customer, either during an online Checkout at a third party and/or on the statement of the customer. For card transactions this is usually referred to as a Soft Descriptor. The maximum allowed length varies per card acquirer:  * AIB - 22 characters  * American Express - 25 characters  * Atos Origin BNP - 15 characters  * Barclays - 25 characters  * Catella - 22 characters  * CBA - 20 characters  * Elavon - 25 characters  * First Data - 25 characters  * INICIS (INIPAY) - 22-30 characters  * JCB - 25 characters  * Merchant Solutions - 22-25 characters  * Payvision (EU & HK) - 25 characters  * SEB Euroline - 22 characters  * Sub1 Argentina - 15 characters  * Wells Fargo - 25 characters  Note that we advise you to use 22 characters as the max length as beyond this our experience is that issuers will start to truncate. We currently also only allow per API call overrides for AIB and Barclays For alternative payment products the maximum allowed length varies per payment product:  * 402 e-Przelewy - 30 characters  * 404 INICIS - 80 characters  * 802 Nordea ePayment Finland - 234 characters  * 809 iDeal - 32 characters  * 836 SOFORT - 42 characters  * 840 PayPal - 127 characters  * 841 WebMoney - 175 characters  * 849 Yandex - 64 characters  * 861 Alipay - 256 characters  * 863 WeChat Pay - 32 characters  * 880 BOKU - 20 characters  * 8580 Qiwi - 255 characters  * 1504 Konbini - 80 characters  All other payment products don't support a descriptor.
      # @return [String, nil]
      attr_accessor :descriptor

      # The merchantReference is a unique identifier for a payment and can be used for reporting purposes. The merchantReference is required for the execution of a payment and has to be unique. In case a payment has failed the same merchantReference can be used again. Once a successful payment has been made the same merchantReference can no longer be used and will be rejected.
      # @return [String, nil]
      attr_accessor :merchant_reference

      # It allows you to store additional parameters for the transaction in JSON format. This field must not contain any personal data.
      # @return [String, nil]
      attr_accessor :merchant_parameters

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            descriptor == o.descriptor &&
            merchant_reference == o.merchant_reference &&
            merchant_parameters == o.merchant_parameters
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [descriptor, merchant_reference, merchant_parameters].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['descriptor'] = @descriptor unless @descriptor.nil?
        hash['merchantReference'] = @merchant_reference unless @merchant_reference.nil?
        hash['merchantParameters'] = @merchant_parameters unless @merchant_parameters.nil?
        hash
      end

      def from_hash(hash)
        @descriptor = hash['descriptor'] if hash.key? 'descriptor'
        @merchant_reference = hash['merchantReference'] if hash.key? 'merchantReference'
        @merchant_parameters = hash['merchantParameters'] if hash.key? 'merchantParameters'
      end
    end
  end
end
