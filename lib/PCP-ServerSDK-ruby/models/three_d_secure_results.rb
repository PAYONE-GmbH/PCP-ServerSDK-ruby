require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # 3D Secure results object
    class ThreeDSecureResults < PCPServerSDK::ApiModel
      # 3D Secure Protocol version used during this transaction.
      # @return [String, nil]
      attr_accessor :version

      # 3D Secure ECI (Electronic Commerce Indicator) depending on the Scheme. Returned by DS.
      # @return [String, nil]
      attr_accessor :scheme_eci

      # Exemption requested and applied in the authorization.
      # Should be one of the string constants provided by {PCPServerSDK::Models::AppliedExemption}
      # @return [String, nil]
      attr_accessor :applied_exemption

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            version == o.version &&
            scheme_eci == o.scheme_eci &&
            applied_exemption == o.applied_exemption
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [version, scheme_eci, applied_exemption].hash
      end

      def to_hash
        hash = {}
        hash['version'] = @version unless @version.nil?
        hash['schemeEci'] = @scheme_eci unless @scheme_eci.nil?
        hash['appliedExemption'] = @applied_exemption unless @applied_exemption.nil?
        hash
      end

      def from_hash(hash)
        @version = hash['version'] if hash.key? 'version'
        @scheme_eci = hash['schemeEci'] if hash.key? 'schemeEci'
        @applied_exemption = hash['appliedExemption'] if hash.key? 'appliedExemption'
      end
    end
  end
end
