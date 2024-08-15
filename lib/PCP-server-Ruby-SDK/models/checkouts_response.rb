require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    # Object that holds the number of found Checkouts and the requested page of Checkouts
    class CheckoutsResponse < PCPServerSDK::ApiModel
      # Number of found Checkouts
      # @return [Integer]
      attr_accessor :number_of_checkouts

      # List of Checkouts
      # @return [Array<PCPServerSDK::Models::CheckoutResponse>]
      attr_accessor :checkouts

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            number_of_checkouts == o.number_of_checkouts &&
            checkouts == o.checkouts
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [number_of_checkouts, checkouts].hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        hash['numberOfCheckouts'] = @number_of_checkouts unless @number_of_checkouts.nil?
        hash['checkouts'] = @checkouts.map(&:to_hash) unless @checkouts.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @number_of_checkouts = hash['numberOfCheckouts'] if hash.key? 'numberOfCheckouts'
        if hash.key? 'checkouts'
          @checkouts = CheckoutsResponse.new_from_hash_array(hash['checkouts'])
        end
      end
    end
  end
end
