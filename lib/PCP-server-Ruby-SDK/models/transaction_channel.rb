
require 'date'
require 'time'

module PCPServerSDK
  module Models
    class TransactionChannel
      ECOMMERCE = "ECOMMERCE".freeze
      MOTO = "MOTO".freeze

      def self.all_vars
        @all_vars ||= [ECOMMERCE, MOTO].freeze
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
        return value if TransactionChannel.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #TransactionChannel"
      end
    end
  end
end
