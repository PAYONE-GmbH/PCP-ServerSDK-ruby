
require 'date'
require 'time'

class StatusCategoryValue
  CREATED = "CREATED".freeze
  UNSUCCESSFUL = "UNSUCCESSFUL".freeze
  PENDING_PAYMENT = "PENDING_PAYMENT".freeze
  PENDING_MERCHANT = "PENDING_MERCHANT".freeze
  PENDING_CONNECT_OR_3_RD_PARTY = "PENDING_CONNECT_OR_3RD_PARTY".freeze
  COMPLETED = "COMPLETED".freeze
  REVERSED = "REVERSED".freeze
  REFUNDED = "REFUNDED".freeze

  def self.all_vars
    @all_vars ||= [CREATED, UNSUCCESSFUL, PENDING_PAYMENT, PENDING_MERCHANT, PENDING_CONNECT_OR_3_RD_PARTY, COMPLETED, REVERSED, REFUNDED].freeze
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
    return value if StatusCategoryValue.all_vars.include?(value)
    raise "Invalid ENUM value #{value} for class #StatusCategoryValue"
  end
end
