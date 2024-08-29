
require 'date'
require 'time'

class CancellationReason
  CONSUMER_REQUEST = "CONSUMER_REQUEST".freeze
  UNDELIVERABLE = "UNDELIVERABLE".freeze
  DUPLICATE = "DUPLICATE".freeze
  FRAUDULENT = "FRAUDULENT".freeze
  ORDER_SHIPPED_IN_FULL = "ORDER_SHIPPED_IN_FULL".freeze
  AUTOMATED_SHIPMENT_FAILED = "AUTOMATED_SHIPMENT_FAILED".freeze

  def self.all_vars
    @all_vars ||= [CONSUMER_REQUEST, UNDELIVERABLE, DUPLICATE, FRAUDULENT, ORDER_SHIPPED_IN_FULL, AUTOMATED_SHIPMENT_FAILED].freeze
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
    return value if CancellationReason.all_vars.include?(value)
    raise "Invalid ENUM value #{value} for class #CancellationReason"
  end
end
