require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing the mobile payment method details.
    class MobilePaymentMethodSpecificOutput < PCPServerSDK::ApiModel
      # Payment product identifier - please check product documentation for a full overview of possible values.
      # @return [Integer, nil]
      attr_accessor :payment_product_id

      # Card Authorization code as returned by the acquirer
      # @return [String, nil]
      attr_accessor :authorisation_code

      # @return [PCPServerSDK::Models::CardFraudResults, nil]
      attr_accessor :fraud_results

      # @return [PCPServerSDK::Models::ThreeDSecureResults, nil]
      attr_accessor :three_d_secure_results

      # The card network that was used for a mobile payment method operation
      # @return [String, nil]
      attr_accessor :network

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_product_id == o.payment_product_id &&
            authorisation_code == o.authorisation_code &&
            fraud_results == o.fraud_results &&
            three_d_secure_results == o.three_d_secure_results &&
            network == o.network
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_product_id, authorisation_code, fraud_results, three_d_secure_results, network].hash
      end

      def to_hash
        hash = {}
        hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
        hash['authorisationCode'] = @authorisation_code unless @authorisation_code.nil?
        hash['fraudResults'] = @fraud_results.to_hash unless @fraud_results.nil?
        hash['threeDSecureResults'] = @three_d_secure_results.to_hash unless @three_d_secure_results.nil?
        hash['network'] = @network unless @network.nil?
        hash
      end

      def from_hash(hash)
        @payment_product_id = hash['paymentProductId'] if hash.key? 'paymentProductId'
        @authorisation_code = hash['authorisationCode'] if hash.key? 'authorisationCode'
        if hash.key? 'fraudResults'
          @fraud_results = CardFraudResults.new_from_hash(hash['fraudResults'])
        end
        if hash.key? 'threeDSecureResults'
          @three_d_secure_results = ThreeDSecureResults.new_from_hash(hash['threeDSecureResults'])
        end
        @network = hash['network'] if hash.key? 'network'
      end
    end
  end
end
