require 'date'
require 'time'

# The refreshType refers to the type of the payment status refresh.
# - PAYMENT_EVENTS = Refresh the payment status of the payment and return the events.
#   This is a synchronization of the payment status with the payment platform.
#   This can be used in case of any possible inconsistencies between the commerce platform and the payment platform.
# - PAYMENT_PROVIDER_DETAILS = Refresh the payment status of the payment and return the payment provider details.
#   This is a synchronization of the payment with the external payment provider.
#   The current use case is to update the customer status of a transaction using PAYONE Buy Now, Pay Later (BNPL) with the external provider Payla.
module PCPServerSDK
  module Models
    class RefreshType
      PAYMENT_EVENTS = "PAYMENT_EVENTS".freeze
      PAYMENT_PROVIDER_DETAILS = "PAYMENT_PROVIDER_DETAILS".freeze

      def self.all_vars
        @all_vars ||= [PAYMENT_EVENTS, PAYMENT_PROVIDER_DETAILS].freeze
      end

      # Builds the enum from string
      # @param [String] value The enum value in the form of the string
      # @return [String] The enum value
      def self.build_from_hash(value)
        return value if RefreshType.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #StatusValue"
      end
    end
  end
end
