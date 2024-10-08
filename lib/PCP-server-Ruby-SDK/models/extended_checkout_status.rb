
require 'date'
require 'time'

module PCPServerSDK
  module Models
    class ExtendedCheckoutStatus
      OPEN = "OPEN".freeze
      DELETED = "DELETED".freeze
      PENDING_COMPLETION = "PENDING_COMPLETION".freeze
      COMPLETED = "COMPLETED".freeze
      PARTIALLY_BILLED = "PARTIALLY_BILLED".freeze
      BILLED = "BILLED".freeze
      CHARGEBACKED = "CHARGEBACKED".freeze
      PARTIALLY_REFUNDED = "PARTIALLY_REFUNDED".freeze
      REFUNDED = "REFUNDED".freeze

      def self.all_vars
        @all_vars ||= [OPEN, DELETED, PENDING_COMPLETION, COMPLETED, PARTIALLY_BILLED, BILLED, CHARGEBACKED, PARTIALLY_REFUNDED, REFUNDED].freeze
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
        return value if ExtendedCheckoutStatus.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #ExtendedCheckoutStatus"
      end
    end
  end
end
