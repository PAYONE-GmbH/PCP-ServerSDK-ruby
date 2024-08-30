
module PCPServerSDK
  module Models
    class Network
      VISA = 'VISA'.freeze
      MASTERCARD = 'MASTERCARD'.freeze
      AMEX = 'AMEX'.freeze
      GIROCARD = 'GIROCARD'.freeze
      DISCOVER = 'DISCOVER'.freeze
      JCB = 'JCB'.freeze

      def self.all_networks
        [VISA, MASTERCARD, AMEX, GIROCARD, DISCOVER, JCB]
      end

      def self.from_string(value)
        network = all_networks.find { |net| net.casecmp(value).zero? }
        raise TypeError, "'#{value}' can't represent a Network" unless network

        network
      end
    end
  end
end
