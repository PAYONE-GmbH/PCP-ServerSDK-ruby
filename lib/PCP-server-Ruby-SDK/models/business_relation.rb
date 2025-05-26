require 'date'
require 'time'

module PCPServerSDK
  module Models
    class BusinessRelation
      B2C = "B2C".freeze  # Indicates business to consumer
      B2B = "B2B".freeze  # Indicates business to business

      def self.all_vars
        @all_vars ||= [B2C, B2B].freeze
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
        return value if BusinessRelation.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #BusinessRelation"
      end
    end
  end
end
