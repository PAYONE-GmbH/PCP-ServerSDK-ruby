require 'date'
require 'time'

module PCPServerSDK
  module Models
    class RecurringPaymentSequenceIndicator
      FIRST = "first".freeze     # This transaction is the first of a series of recurring transactions
      RECURRING = "recurring".freeze    # This transaction is a subsequent transaction in a series of recurring transactions

      def self.all_vars
        @all_vars ||= [FIRST, RECURRING].freeze
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
        return value if RecurringPaymentSequenceIndicator.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #RecurringPaymentSequenceIndicator"
      end
    end
  end
end
