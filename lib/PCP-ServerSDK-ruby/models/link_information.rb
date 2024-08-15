require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # URL and content type information for an web resource.
    class LinkInformation < PCPServerSDK::ApiModel
      # URL of link.
      # @return [String, nil]
      attr_accessor :href

      # Content type of linked data.
      # @return [String, nil]
      attr_accessor :type

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            href == o.href &&
            type == o.type
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [href, type].hash
      end
      def to_hash
        hash = {}
        hash['href'] = @href unless @href.nil?
        hash['type'] = @type unless @type.nil?
        hash
      end

      def from_hash(hash)
        @href = hash['href'] if hash.key? 'href'
        @type = hash['type'] if hash.key? 'type'
      end
    end
  end
end
