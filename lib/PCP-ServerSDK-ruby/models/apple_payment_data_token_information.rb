require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Additional information about the Apple payment data token. This information is needed for checking the validity
    # of the payment data token before decryption.
    class ApplePaymentDataTokenInformation < PCPServerSDK::ApiModel
      # Version information about the payment token. Currently only EC_v1 for ECC-encrypted data is supported.
      # @return [String,nil]
      attr_accessor :version

      # Detached PKCS #7 signature, Base64 encoded as string. Signature of the payment and header data. The signature includes the signing certificate, its intermediate CA certificate, and information about the signing algorithm.
      # @return [String, nil]
      attr_accessor :signature

      # Additional information about the Apple payment data token header.
      # @return [PCPServerSDK::Models::ApplePaymentDataTokenHeaderInformation, nil]
      attr_accessor :header

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            version == o.version &&
            signature == o.signature &&
            header == o.header
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [version, signature, header].hash
      end

      def to_hash
        hash = {}
        hash['version'] = @version unless @version.nil?
        hash['signature'] = @signature unless @signature.nil?
        hash['header'] = @header.to_hash unless @header.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @version = hash['version'] if hash.key? 'version'
        @signature = hash['signature'] if hash.key? 'signature'
        if hash.key? 'header'
          @header = ApplePaymentDataTokenHeaderInformation.new_from_hash(hash['header'])
        end
      end
    end
  end
end
