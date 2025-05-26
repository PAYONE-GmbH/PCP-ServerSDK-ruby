require 'date'
require 'time'

module PCPServerSDK
  module Models
    class ActionType
      REDIRECT = "REDIRECT".freeze                           # The customer needs to be redirected using the details found in redirectData
      SHOW_FORM = "SHOW_FORM".freeze                        # The customer needs to be shown a form with the fields found in formFields
      SHOW_INSTRUCTIONS = "SHOW_INSTRUCTIONS".freeze         # The customer needs to be shown payment instruction using the details found in showData
      SHOW_TRANSACTION_RESULTS = "SHOW_TRANSACTION_RESULTS".freeze  # The customer needs to be shown the transaction results using the details found in showData
      MOBILE_THREEDS_CHALLENGE = "MOBILE_THREEDS_CHALLENGE".freeze  # The customer needs to complete a challenge as part of the 3D Secure authentication inside your mobile app
      CALL_THIRD_PARTY = "CALL_THIRD_PARTY".freeze          # The merchant needs to call a third party using the data found in thirdPartyData

      def self.all_vars
        @all_vars ||= [REDIRECT, SHOW_FORM, SHOW_INSTRUCTIONS, SHOW_TRANSACTION_RESULTS, MOBILE_THREEDS_CHALLENGE, CALL_THIRD_PARTY].freeze
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
        return value if ActionType.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #ActionType"
      end
    end
  end
end
