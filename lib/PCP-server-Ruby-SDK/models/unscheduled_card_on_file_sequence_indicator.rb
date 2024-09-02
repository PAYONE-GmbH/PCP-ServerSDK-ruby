
require 'date'
require 'time'

module PCPServerSDK
  module Models
    class UnscheduledCardOnFileSequenceIndicator
      FIRST = "first".freeze
      SUBSEQUENT = "subsequent".freeze

      def self.all_vars
        @all_vars ||= [FIRST, SUBSEQUENT].freeze
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
        return value if UnscheduledCardOnFileSequenceIndicator.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #UnscheduledCardOnFileSequenceIndicator"
      end
    end
  end
end
