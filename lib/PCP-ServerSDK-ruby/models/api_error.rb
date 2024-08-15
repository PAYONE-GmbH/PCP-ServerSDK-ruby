require 'PCP-ServerSDK-ruby/api_model'

module PCPServerSDK
  module Models
    # Contains detailed information on one single error.
    class APIError < PCPServerSDK::ApiModel
      # Error code
      # @return [String, nil]
      attr_accessor :error_code

      # Category the error belongs to. The category should give an indication of the type of error you are dealing with. Possible values: * DIRECT_PLATFORM_ERROR - indicating that a functional error has occurred in the platform. * PAYMENT_PLATFORM_ERROR - indicating that a functional error has occurred in the payment platform. * IO_ERROR - indicating that a technical error has occurred within the payment platform or between the payment platform and third party systems. * COMMERCE_PLATFORM_ERROR - indicating an error originating from the Commerce Platform. * COMMERCE_PORTAL_BACKEND_ERROR - indicating an error originating from the Commerce Portal Backend.
      # @return [String, nil]
      attr_accessor :category

      # HTTP status code for this error that can be used to determine the type of error
      # @return [Integer, nil]
      attr_accessor :http_status_code

      # ID of the error. This is a short human-readable message that briefly describes the error.
      # @return [String, nil]
      attr_accessor :id

      # Human-readable error message that is not meant to be relayed to customer as it might tip off people who are trying to commit fraud
      # @return [String, nil]
      attr_accessor :message

      # Returned only if the error relates to a value that was missing or incorrect.  Contains a location path to the value as a JSonata query.  Some common examples: * a.b selects the value of property b of root property a, * a[1] selects the first element of the array in root property a, * a[b='some value'] selects all elements of the array in root property a that have a property b with value 'some value'.
      # @return [String, nil]
      attr_accessor :property_name

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            error_code == o.error_code &&
            category == o.category &&
            http_status_code == o.http_status_code &&
            id == o.id &&
            message == o.message &&
            property_name == o.property_name
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [error_code, category, http_status_code, id, message, property_name].hash
      end

      def to_hash
        hash = {}
        hash['errorCode'] = @error_code unless @error_code.nil?
        hash['category'] = @category unless @category.nil?
        hash['httpStatusCode'] = @http_status_code unless @http_status_code.nil?
        hash['id'] = @id unless @id.nil?
        hash['message'] = @message unless @message.nil?
        hash['propertyName'] = @property_name unless @property_name.nil?
        hash
      end

      # @param hash [Hash]
      def from_hash(hash)
        @error_code = hash['errorCode'] if hash.key? 'errorCode'
        @category = hash['category'] if hash.key? 'category'
        @http_status_code = hash['httpStatusCode'] if hash.key? 'httpStatusCode'
        @id = hash['id'] if hash.key? 'id'
        @message = hash['message'] if hash.key? 'message'
        @property_name = hash['propertyName'] if hash.key? 'propertyName'
      end
    end
  end
end
