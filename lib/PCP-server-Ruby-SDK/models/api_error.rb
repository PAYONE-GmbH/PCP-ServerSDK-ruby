
require 'date'
require 'time'
module PCPServerSDK
  module Models
    # Contains detailed information on one single error.
    class APIError
      # Error code
      attr_accessor :error_code

      # Category the error belongs to. The category should give an indication of the type of error you are dealing with. Possible values: * DIRECT_PLATFORM_ERROR - indicating that a functional error has occurred in the platform. * PAYMENT_PLATFORM_ERROR - indicating that a functional error has occurred in the payment platform. * IO_ERROR - indicating that a technical error has occurred within the payment platform or between the payment platform and third party systems. * COMMERCE_PLATFORM_ERROR - indicating an error originating from the Commerce Platform. * COMMERCE_PORTAL_BACKEND_ERROR - indicating an error originating from the Commerce Portal Backend.
      attr_accessor :category

      # HTTP status code for this error that can be used to determine the type of error
      attr_accessor :http_status_code

      # ID of the error. This is a short human-readable message that briefly describes the error.
      attr_accessor :id

      # Human-readable error message that is not meant to be relayed to customer as it might tip off people who are trying to commit fraud
      attr_accessor :message

      # Returned only if the error relates to a value that was missing or incorrect.  Contains a location path to the value as a JSonata query.  Some common examples: * a.b selects the value of property b of root property a, * a[1] selects the first element of the array in root property a, * a[b='some value'] selects all elements of the array in root property a that have a property b with value 'some value'.
      attr_accessor :property_name

      # Attribute mapping from ruby-style variable name to JSON key.
      def self.attribute_map
        {
          :'error_code' => :'errorCode',
          :'category' => :'category',
          :'http_status_code' => :'httpStatusCode',
          :'id' => :'id',
          :'message' => :'message',
          :'property_name' => :'propertyName'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.openapi_types
        {
          :'error_code' => :'String',
          :'category' => :'String',
          :'http_status_code' => :'Integer',
          :'id' => :'String',
          :'message' => :'String',
          :'property_name' => :'String'
        }
      end

      # List of attributes with nullable: true
      def self.openapi_nullable
        Set.new([
        ])
      end

      # Initializes the object
      # @param [Hash] attributes Model attributes in the form of hash
      def initialize(attributes = {})
        if (!attributes.is_a?(Hash))
          fail ArgumentError, "The input argument (attributes) must be a hash in `APIError` initialize method"
        end

        # check to see if the attribute exists and convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `APIError`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'error_code')
          self.error_code = attributes[:'error_code']
        else
          self.error_code = nil
        end

        if attributes.key?(:'category')
          self.category = attributes[:'category']
        end

        if attributes.key?(:'http_status_code')
          self.http_status_code = attributes[:'http_status_code']
        end

        if attributes.key?(:'id')
          self.id = attributes[:'id']
        end

        if attributes.key?(:'message')
          self.message = attributes[:'message']
        end

        if attributes.key?(:'property_name')
          self.property_name = attributes[:'property_name']
        end
      end

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

      # Builds the object from hash
      # @param [Hash] attributes Model attributes in the form of hash
      # @return [Object] Returns the model itself
      def self.build_from_hash(attributes)
        return nil unless attributes.is_a?(Hash)
        attributes = attributes.transform_keys(&:to_sym)
        transformed_hash = {}
        openapi_types.each_pair do |key, type|
          if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
            transformed_hash["#{key}"] = nil
          elsif type =~ /\AArray<(.*)>/i
            # check to ensure the input is an array given that the attribute
            # is documented as an array but the input is not
            if attributes[attribute_map[key]].is_a?(Array)
              transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
            end
          elsif !attributes[attribute_map[key]].nil?
            transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
          end
        end
        new(transformed_hash)
      end

      # Deserializes the data based on type
      # @param string type Data type
      # @param string value Value to be deserialized
      # @return [Object] Deserialized data
      def self._deserialize(type, value)
        case type.to_sym
        when :Time
          Time.parse(value)
        when :Date
          Date.parse(value)
        when :String
          value.to_s
        when :Integer
          value.to_i
        when :Float
          value.to_f
        when :Boolean
          if value.to_s =~ /\A(true|t|yes|y|1)\z/i
            true
          else
            false
          end
        when :Object
          # generic object (usually a Hash), return directly
          value
        when /\AArray<(?<inner_type>.+)>\z/
          inner_type = Regexp.last_match[:inner_type]
          value.map { |v| _deserialize(inner_type, v) }
        when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
          k_type = Regexp.last_match[:k_type]
          v_type = Regexp.last_match[:v_type]
          {}.tap do |hash|
            value.each do |k, v|
              hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
            end
          end
        else # model
          # models (e.g. Pet) or oneOf
          klass = PCPServerSDK::Models.const_get(type)
          klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
        end
      end

      # Returns the string representation of the object
      # @return [String] String presentation of the object
      def to_s
        to_hash.to_s
      end

      # to_body is an alias to to_hash (backward compatibility)
      # @return [Hash] Returns the object in the form of hash
      def to_body
        to_hash
      end

      # Returns the object in the form of hash
      # @return [Hash] Returns the object in the form of hash
      def to_hash
        hash = {}
        self.class.attribute_map.each_pair do |attr, param|
          value = self.send(attr)
          if value.nil?
            is_nullable = self.class.openapi_nullable.include?(attr)
            next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
          end

          hash[param] = _to_hash(value)
        end
        hash
      end

      # Outputs non-array value in the form of hash
      # For object, use to_hash. Otherwise, just return the value
      # @param [Object] value Any valid value
      # @return [Hash] Returns the value in the form of hash
      def _to_hash(value)
        if value.is_a?(Array)
          value.compact.map { |v| _to_hash(v) }
        elsif value.is_a?(Hash)
          {}.tap do |hash|
            value.each { |k, v| hash[k] = _to_hash(v) }
          end
        elsif value.respond_to? :to_hash
          value.to_hash
        else
          value
        end
      end
    end
  end
end
