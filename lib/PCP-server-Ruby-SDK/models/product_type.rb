
require 'date'
require 'time'

class ProductType
  GOODS = "GOODS".freeze
  SHIPMENT = "SHIPMENT".freeze
  HANDLING_FEE = "HANDLING_FEE".freeze
  DISCOUNT = "DISCOUNT".freeze

  def self.all_vars
    @all_vars ||= [GOODS, SHIPMENT, HANDLING_FEE, DISCOUNT].freeze
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
    return value if ProductType.all_vars.include?(value)
    raise "Invalid ENUM value #{value} for class #ProductType"
  end
end
