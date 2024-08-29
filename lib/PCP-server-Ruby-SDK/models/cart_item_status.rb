
require 'date'
require 'time'

class CartItemStatus
  ORDERED = "ORDERED".freeze
  DELIVERED = "DELIVERED".freeze
  CANCELLED = "CANCELLED".freeze
  RETURNED = "RETURNED".freeze
  WAITING_FOR_PAYMENT = "WAITING_FOR_PAYMENT".freeze

  def self.all_vars
    @all_vars ||= [ORDERED, DELIVERED, CANCELLED, RETURNED, WAITING_FOR_PAYMENT].freeze
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
    return value if CartItemStatus.all_vars.include?(value)
    raise "Invalid ENUM value #{value} for class #CartItemStatus"
  end
end
