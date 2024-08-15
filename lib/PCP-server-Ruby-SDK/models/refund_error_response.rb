require 'PCP-server-Ruby-SDK/api_model'

module PCPServerSDK
  module Models
    class RefundErrorResponse < PCPServerSDK::ApiModel
      # Unique reference, for debugging purposes, of this error response
      # @return [String, nil]
      attr_accessor :error_id

      # @return [Array<PCPServerSDK::Models::APIError>, nil]
      attr_accessor :errors

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            error_id == o.error_id &&
            errors == o.errors
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [error_id, errors].hash
      end

      def to_hash
        hash = {}
        hash['errorId'] = @error_id unless @error_id.nil?
        hash['errors'] = @errors.map(&:to_hash) unless @errors.nil?
        hash
      end

      def from_hash(hash)
        @error_id = hash['errorId'] if hash.key? 'errorId'
        if hash.key? 'errors'
          @errors = APIError.new_from_hash_array(hash['errors'])
        end
      end
    end
  end
end
