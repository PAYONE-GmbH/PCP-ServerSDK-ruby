
require 'date'
require 'time'

# Object containing the specific input details for payments that involve redirects to 3rd parties to complete, like iDeal and PayPal
module PCPServerSDK
  module Models
    class RedirectPaymentMethodSpecificInput
      # * true = the payment requires approval before the funds will be captured using the Approve payment or Capture payment API * false = the payment does not require approval, and the funds will be captured automatically  If the parameter is not provided in the request, the default value will be true
      attr_accessor :requires_approval

      # ID of the token to use to create the payment.
      attr_accessor :payment_processing_token

      # Token to identify the card in the reporting.
      attr_accessor :reporting_token

      # Indicates if this transaction should be tokenized   * true - Tokenize the transaction.   * false - Do not tokenize the transaction, unless it would be tokenized by other means such as auto- tokenization of recurring payments. example: false
      attr_accessor :tokenize

      # Payment product identifier - please check product documentation for a full overview of possible values.
      attr_accessor :payment_product_id

      attr_accessor :payment_product840_specific_input

      attr_accessor :redirection_data

      # Attribute mapping from ruby-style variable name to JSON key.
      def self.attribute_map
        {
          :'requires_approval' => :'requiresApproval',
          :'payment_processing_token' => :'paymentProcessingToken',
          :'reporting_token' => :'reportingToken',
          :'tokenize' => :'tokenize',
          :'payment_product_id' => :'paymentProductId',
          :'payment_product840_specific_input' => :'paymentProduct840SpecificInput',
          :'redirection_data' => :'redirectionData'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.openapi_types
        {
          :'requires_approval' => :'Boolean',
          :'payment_processing_token' => :'String',
          :'reporting_token' => :'String',
          :'tokenize' => :'Boolean',
          :'payment_product_id' => :'Integer',
          :'payment_product840_specific_input' => :'RedirectPaymentProduct840SpecificInput',
          :'redirection_data' => :'RedirectionData'
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
          fail ArgumentError, "The input argument (attributes) must be a hash in `RedirectPaymentMethodSpecificInput` initialize method"
        end

        # check to see if the attribute exists and convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `RedirectPaymentMethodSpecificInput`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'requires_approval')
          self.requires_approval = attributes[:'requires_approval']
        end

        if attributes.key?(:'payment_processing_token')
          self.payment_processing_token = attributes[:'payment_processing_token']
        end

        if attributes.key?(:'reporting_token')
          self.reporting_token = attributes[:'reporting_token']
        end

        if attributes.key?(:'tokenize')
          self.tokenize = attributes[:'tokenize']
        end

        if attributes.key?(:'payment_product_id')
          self.payment_product_id = attributes[:'payment_product_id']
        end

        if attributes.key?(:'payment_product840_specific_input')
          self.payment_product840_specific_input = attributes[:'payment_product840_specific_input']
        end

        if attributes.key?(:'redirection_data')
          self.redirection_data = attributes[:'redirection_data']
        end
      end

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            requires_approval == o.requires_approval &&
            payment_processing_token == o.payment_processing_token &&
            reporting_token == o.reporting_token &&
            tokenize == o.tokenize &&
            payment_product_id == o.payment_product_id &&
            payment_product840_specific_input == o.payment_product840_specific_input &&
            redirection_data == o.redirection_data
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [requires_approval, payment_processing_token, reporting_token, tokenize, payment_product_id, payment_product840_specific_input, redirection_data].hash
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
