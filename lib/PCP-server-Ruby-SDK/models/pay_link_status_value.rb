module PCPServerSDK
  module Models
    class PayLinkStatusValue
      ACTIVE = 'ACTIVE'.freeze
      PAID = 'PAID'.freeze
      EXPIRED = 'EXPIRED'.freeze
      REDIRECTED = 'REDIRECTED'.freeze

      def self.all_vars
        @all_vars ||= [ACTIVE, PAID, EXPIRED, REDIRECTED].freeze
      end

      def self.build_from_hash(value)
        return value if all_vars.include?(value)

        raise "Invalid ENUM value #{value} for class #PayLinkStatusValue"
      end
    end
  end
end
