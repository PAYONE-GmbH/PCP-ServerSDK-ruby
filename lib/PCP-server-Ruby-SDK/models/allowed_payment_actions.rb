
require 'date'
require 'time'

class AllowedPaymentActions
  ORDER_MANAGEMENT = "ORDER_MANAGEMENT".freeze
  PAYMENT_EXECUTION = "PAYMENT_EXECUTION".freeze

  def self.all_vars
    @all_vars ||= [ORDER_MANAGEMENT, PAYMENT_EXECUTION].freeze
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
    return value if AllowedPaymentActions.all_vars.include?(value)
    raise "Invalid ENUM value #{value} for class #AllowedPaymentActions"
  end
end
