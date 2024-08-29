
require 'date'
require 'time'

class ReturnType
  FULL = "FULL".freeze
  PARTIAL = "PARTIAL".freeze

  def self.all_vars
    @all_vars ||= [FULL, PARTIAL].freeze
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
    return value if ReturnType.all_vars.include?(value)
    raise "Invalid ENUM value #{value} for class #ReturnType"
  end
end
