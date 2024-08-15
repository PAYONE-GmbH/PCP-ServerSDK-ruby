require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Object containing details of the company.
    class CompanyInformation < PCPServerSDK::ApiModel
      # Name of company from a customer perspective
      # @return [String, nil]
      attr_accessor :name

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            name == o.name
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [name].hash
      end

      def to_hash
        hash = {}
        hash['name'] = @name unless @name.nil?
        hash
      end

      def from_hash(hash)
        @name = hash['name'] if hash.key? 'name'
      end
    end
  end
end
