require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object containing information regarding shipping / delivery
    class Shipping < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::AddressPersonal, nil]
      attr_accessor :address

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            address == o.address
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [address].hash
      end

      def to_hash
        hash = {}
        hash['address'] = @address.to_hash unless @address.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'address'
          @address = AddressPersonal.new_from_hash(hash['address'])
        end
      end
    end
  end
end
