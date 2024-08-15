require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Update the customer data of the given Commerce Case
    class PatchCommerceCaseRequest < PCPServerSDK::ApiModel
      # @return [PCPServerSDK::Models::Customer, nil]
      attr_accessor :customer

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            customer == o.customer
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [customer].hash
      end

      def to_hash
        hash = {}
        hash['customer'] = @customer.to_hash unless @customer.nil?
        hash
      end

      def from_hash(hash)
        if hash.key? 'customer'
          @customer = Customer.new_from_hash(hash['customer'])
        end
      end
    end
  end
end
