
module PCPServerSDK
  module Models
    class MobilePaymentNetwork
      MASTERCARD = 'MASTERCARD'.freeze
      VISA = 'VISA'.freeze
      AMEX = 'AMEX'.freeze
      GIROCARD = 'GIROCARD'.freeze
      DISCOVER = 'DISCOVER'.freeze
      JCB = 'JCB'.freeze

      def self.all_networks
        [MASTERCARD, VISA, AMEX, GIROCARD, DISCOVER, JCB]
      end

      def self.from_string(value)
        network = all_networks.find { |net| net.casecmp(value).zero? }
        raise TypeError, "'#{value}' can't represent a MobilePaymentNetwork" unless network

        network
      end
    end
  end
end
