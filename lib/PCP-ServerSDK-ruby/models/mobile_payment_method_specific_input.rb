require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing the specific input details for mobile payments.
    class MobilePaymentMethodSpecificInput < PCPServerSDK::ApiModel
      # Payment product identifier - please check product documentation for a full overview of possible values.
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # Should be one of the string constants provided by PCPServerSDK::Models::AuthorizationMode
      # @return [String, nil]
      attr_accessor :authorization_mode

      # The payment data if we will do the decryption of the encrypted payment data. Typically you'd use encryptedCustomerInput in the root of the create payment request to provide the encrypted payment data instead.
      # @return [String, nil]
      attr_accessor :encrypted_payment_data

      # Public Key Hash A unique identifier to retrieve key used by Apple to encrypt information.
      # @return [String, nil]
      attr_accessor :public_key_hash

      # Ephemeral Key A unique generated key used by Apple to encrypt data.
      # @return [String, nil]
      attr_accessor :ephemeral_key

      # @return [PCPServerSDK::Models::PaymentProduct320SpecificInput, nil]
      attr_accessor :payment_product302_specific_input

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_product_id == o.payment_product_id &&
            authorization_mode == o.authorization_mode &&
            encrypted_payment_data == o.encrypted_payment_data &&
            public_key_hash == o.public_key_hash &&
            ephemeral_key == o.ephemeral_key &&
            payment_product302_specific_input == o.payment_product302_specific_input
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_product_id, authorization_mode, encrypted_payment_data, public_key_hash, ephemeral_key, payment_product302_specific_input].hash
      end

      def to_hash
        hash = {}
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['authorizationMode'] = @authorization_mode unless @authorization_mode.nil?
        hash['encryptedPaymentData'] = @encrypted_payment_data unless @encrypted_payment_data.nil?
        hash['publicKeyHash'] = @public_key_hash unless @public_key_hash.nil?
        hash['ephemeralKey'] = @ephemeral_key unless @ephemeral_key.nil?
        hash['paymentProduct302SpecificInput'] = @payment_product302_specific_input.to_hash unless @payment_product302_specific_input.nil?
        hash
      end

      def from_hash(hash)
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        if hash.key? 'authorizationMode'
          @authorization_mode = AuthorizationMode.validate(hash['authorizationMode'])
        end
        @encrypted_payment_data = hash['encryptedPaymentData'] if hash.key? 'encryptedPaymentData'
        @public_key_hash = hash['publicKeyHash'] if hash.key? 'publicKeyHash'
        @ephemeral_key = hash['ephemeralKey'] if hash.key? 'ephemeralKey'
        if hash.key? 'paymentProduct302SpecificInput'
          @payment_product302_specific_input = PaymentProduct302SpecificInput.new_from_hash(hash['paymentProduct302SpecificInput'])
        end
      end
    end
  end
end
