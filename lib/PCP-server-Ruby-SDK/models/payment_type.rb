
require 'date'
require 'time'

module PCPServerSDK
  module Models
    class PaymentType
      SALE = "SALE".freeze
      RESERVATION = "RESERVATION".freeze
      CAPTURE = "CAPTURE".freeze
      REFUND = "REFUND".freeze
      REVERSAL = "REVERSAL".freeze
      CHARGEBACK_REVERSAL = "CHARGEBACK_REVERSAL".freeze
      CREDIT_NOTE = "CREDIT_NOTE".freeze
      DEBIT_NOTE = "DEBIT_NOTE".freeze

      def self.all_vars
        @all_vars ||= [SALE, RESERVATION, CAPTURE, REFUND, REVERSAL, CHARGEBACK_REVERSAL, CREDIT_NOTE, DEBIT_NOTE].freeze
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
        return value if PaymentType.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #PaymentType"
      end
    end
  end
end
