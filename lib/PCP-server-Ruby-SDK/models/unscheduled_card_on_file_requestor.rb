
require 'date'
require 'time'

module PCPServerSDK
  module Models
    class UnscheduledCardOnFileRequestor
      MERCHANT_INITIATED = "merchantInitiated".freeze
      CARDHOLDER_INITIATED = "cardholderInitiated".freeze

      def self.all_vars
        @all_vars ||= [MERCHANT_INITIATED, CARDHOLDER_INITIATED].freeze
      end

      # Builds the enum from string
      # @param [String] The enum value in the form of the string
      # @return [String] The enum value
      def self.build_from_hash(value)
        new.build_from_hash(value)
      end

      # Builds the enum from string
      # @param [String] The enum value in the form of the string
      # @return [String] The enum value
      def build_from_hash(value)
        return value if UnscheduledCardOnFileRequestor.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #UnscheduledCardOnFileRequestor"
      end
    end
  end
end
