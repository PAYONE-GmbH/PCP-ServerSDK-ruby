require 'date'
require 'time'

module PCPServerSDK
  module Models
    # Object containing data related to the account the customer has with you.
    class CustomerAccount
      # Creation date and time of the customer account in ISO 8601 format (UTC).
      attr_accessor :create_date

      # Attribute mapping from ruby-style variable name to JSON key.
      def self.attribute_map
        {
          :'create_date' => :'createDate'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.openapi_types
        {
          :'create_date' => :'Time'
        }
      end

      # Initializes the object
      # @param [Hash] attributes Model attributes in the form of hash
      def initialize(attributes = {})
        if (!attributes.is_a?(Hash))
          fail ArgumentError, "The input argument (attributes) must be a hash in `CustomerAccount` initialize method"
        end

        # check to see if the attribute exists and convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `CustomerAccount`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'create_date')
          self.create_date = attributes[:'create_date']
        end
      end
    end
  end
end
