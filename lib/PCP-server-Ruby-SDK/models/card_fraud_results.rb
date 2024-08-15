require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Fraud results contained in the CardFraudResults object.
    class CardFraudResults < PCPServerSDK::ApiModel
      #     Result of the Address Verification Service checks. Possible values are:
      #      - A - Address (Street) matches, Zip does not
      #      - B - Street address match for international transactions—Postal code not verified due to incompatible
      #      formats
      #      - C - Street address and postal code not verified for international transaction due to incompatible formats
      #      - D - Street address and postal code match for international transaction, cardholder name is incorrect
      #      - E - AVS error
      #      - F - Address does match and five digit ZIP code does match (UK only)
      #      - G - Address information is unavailable; international transaction; non-AVS participant
      #      - H - Billing address and postal code match, cardholder name is incorrect (Amex)
      #      - I - Address information not verified for international transaction
      #      - K - Cardholder name matches (Amex)
      #      - L - Cardholder name and postal code match (Amex)
      #      - M - Cardholder name, street address, and postal code match for international transaction
      #      - N - No Match on Address (Street) or Zip
      #      - O - Cardholder name and address match (Amex)
      #      - P - Postal codes match for international transaction—Street address not verified due to incompatible formats
      #      - Q - Billing address matches, cardholder is incorrect (Amex)
      #      - R - Retry, System unavailable or Timed out
      #      - S - Service not supported by issuer
      #      - U - Address information is unavailable
      #      - W - 9 digit Zip matches, Address (Street) does not
      #      - X - Exact AVS Match
      #      - Y - Address (Street) and 5 digit Zip match
      #      - Z - 5 digit Zip matches, Address (Street) does not
      #      - 0 - No service available
      # @return [String, nil] avs_result
      attr_accessor :avs_result

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            avs_result == o.avs_result
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [avs_result].hash
      end

      def to_hash
        hash = {}
        hash['avsResult'] = @avs_result unless @avs_result.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @avs_result = hash['avsResult'] if hash.key? 'avsResult'
      end
    end
  end
end
