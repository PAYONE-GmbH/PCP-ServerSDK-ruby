
require 'date'
require 'time'

class StatusValue
  CREATED = "CREATED".freeze
  CANCELLED = "CANCELLED".freeze
  REJECTED = "REJECTED".freeze
  REJECTED_CAPTURE = "REJECTED_CAPTURE".freeze
  REDIRECTED = "REDIRECTED".freeze
  PENDING_PAYMENT = "PENDING_PAYMENT".freeze
  PENDING_COMPLETION = "PENDING_COMPLETION".freeze
  PENDING_CAPTURE = "PENDING_CAPTURE".freeze
  AUTHORIZATION_REQUESTED = "AUTHORIZATION_REQUESTED".freeze
  CAPTURE_REQUESTED = "CAPTURE_REQUESTED".freeze
  CAPTURED = "CAPTURED".freeze
  REVERSED = "REVERSED".freeze
  REFUND_REQUESTED = "REFUND_REQUESTED".freeze
  REFUNDED = "REFUNDED".freeze
  REJECTED_REFUND = "REJECTED_REFUND".freeze
  CANCELLATION_REQUESTED = "CANCELLATION_REQUESTED".freeze
  PAUSED = "PAUSED".freeze
  CHARGEBACKED = "CHARGEBACKED".freeze
  CHARGEBACK_REVERSED = "CHARGEBACK_REVERSED".freeze
  ACCOUNT_CREDITED = "ACCOUNT_CREDITED".freeze
  ACCOUNT_DEBITED = "ACCOUNT_DEBITED".freeze
  PAYOUT_REQUESTED = "PAYOUT_REQUESTED".freeze
  REJECTED_CREDIT = "REJECTED_CREDIT".freeze

  def self.all_vars
    @all_vars ||= [CREATED, CANCELLED, REJECTED, REJECTED_CAPTURE, REDIRECTED, PENDING_PAYMENT, PENDING_COMPLETION, PENDING_CAPTURE, AUTHORIZATION_REQUESTED, CAPTURE_REQUESTED, CAPTURED, REVERSED, REFUND_REQUESTED, REFUNDED, REJECTED_REFUND, CANCELLATION_REQUESTED, PAUSED, CHARGEBACKED, CHARGEBACK_REVERSED, ACCOUNT_CREDITED, ACCOUNT_DEBITED, PAYOUT_REQUESTED, REJECTED_CREDIT].freeze
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
    return value if StatusValue.all_vars.include?(value)
    raise "Invalid ENUM value #{value} for class #StatusValue"
  end
end
