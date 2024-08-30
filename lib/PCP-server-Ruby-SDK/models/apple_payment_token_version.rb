
module PCPServerSDK
  module Models
    class ApplePaymentTokenVersion
      EC_V1 = 'EC_V1'.freeze
      # Define other versions as needed

      def self.all_versions
        [EC_V1]
      end

      def self.from_string(value)
        version = all_versions.find { |ver| ver.casecmp(value).zero? }
        raise TypeError, "'#{value}' can't represent an ApplePaymentTokenVersion" unless version

        version
      end
    end
  end
end
