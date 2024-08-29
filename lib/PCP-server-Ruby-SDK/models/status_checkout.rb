
require 'date'
require 'time'

class StatusCheckout
  OPEN = "OPEN".freeze
  PENDING_COMPLETION = "PENDING_COMPLETION".freeze
  COMPLETED = "COMPLETED".freeze
  BILLED = "BILLED".freeze
  CHARGEBACKED = "CHARGEBACKED".freeze
  DELETED = "DELETED".freeze

  def self.all_vars
    @all_vars ||= [OPEN, PENDING_COMPLETION, COMPLETED, BILLED, CHARGEBACKED, DELETED].freeze
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
    return value if StatusCheckout.all_vars.include?(value)
    raise "Invalid ENUM value #{value} for class #StatusCheckout"
  end
end
