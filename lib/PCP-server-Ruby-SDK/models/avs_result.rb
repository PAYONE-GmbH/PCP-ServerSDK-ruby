require 'date'
require 'time'

module PCPServerSDK
  module Models
    class AvsResult
      A = "A".freeze  # Address (Street) matches, Zip does not
      B = "B".freeze  # Street address match for international transactions—Postal code not verified due to incompatible formats
      C = "C".freeze  # Street address and postal code not verified for international transaction due to incompatible formats
      D = "D".freeze  # Street address and postal code match for international transaction, cardholder name is incorrect
      E = "E".freeze  # AVS error
      F = "F".freeze  # Address does match and five digit ZIP code does match (UK only)
      G = "G".freeze  # Address information is unavailable; international transaction; non-AVS participant
      H = "H".freeze  # Billing address and postal code match, cardholder name is incorrect (Amex)
      I = "I".freeze  # Address information not verified for international transaction
      K = "K".freeze  # Cardholder name matches (Amex)
      L = "L".freeze  # Cardholder name and postal code match (Amex)
      M = "M".freeze  # Cardholder name, street address, and postal code match for international transaction
      N = "N".freeze  # No Match on Address (Street) or Zip
      O = "O".freeze  # Cardholder name and address match (Amex)
      P = "P".freeze  # Postal codes match for international transaction—Street address not verified due to incompatible formats
      Q = "Q".freeze  # Billing address matches, cardholder is incorrect (Amex)
      R = "R".freeze  # Retry, System unavailable or Timed out
      S = "S".freeze  # Service not supported by issuer
      U = "U".freeze  # Address information is unavailable
      W = "W".freeze  # 9 digit Zip matches, Address (Street) does not
      X = "X".freeze  # Exact AVS Match
      Y = "Y".freeze  # Address (Street) and 5 digit Zip match
      Z = "Z".freeze  # 5 digit Zip matches, Address (Street) does not
      ZERO = "0".freeze  # No service available

      def self.all_vars
        @all_vars ||= [A, B, C, D, E, F, G, H, I, K, L, M, N, O, P, Q, R, S, U, W, X, Y, Z, ZERO].freeze
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
        return value if AvsResult.all_vars.include?(value)
        raise "Invalid ENUM value #{value} for class #AvsResult"
      end
    end
  end
end
