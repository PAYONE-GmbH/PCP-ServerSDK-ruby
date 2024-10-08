
require 'date'
require 'time'

# Object that holds all reference properties that are linked to this transaction.
module PCPServerSDK
  module Models
    class References
      # Descriptive text that is used towards to customer, either during an online Checkout at a third party and/or on the statement of the customer. For card transactions this is usually referred to as a Soft Descriptor. The maximum allowed length varies per card acquirer:  * AIB - 22 characters  * American Express - 25 characters  * Atos Origin BNP - 15 characters  * Barclays - 25 characters  * Catella - 22 characters  * CBA - 20 characters  * Elavon - 25 characters  * First Data - 25 characters  * INICIS (INIPAY) - 22-30 characters  * JCB - 25 characters  * Merchant Solutions - 22-25 characters  * Payvision (EU & HK) - 25 characters  * SEB Euroline - 22 characters  * Sub1 Argentina - 15 characters  * Wells Fargo - 25 characters  Note that we advise you to use 22 characters as the max length as beyond this our experience is that issuers will start to truncate. We currently also only allow per API call overrides for AIB and Barclays For alternative payment products the maximum allowed length varies per payment product:  * 402 e-Przelewy - 30 characters  * 404 INICIS - 80 characters  * 802 Nordea ePayment Finland - 234 characters  * 809 iDeal - 32 characters  * 836 SOFORT - 42 characters  * 840 PayPal - 127 characters  * 841 WebMoney - 175 characters  * 849 Yandex - 64 characters  * 861 Alipay - 256 characters  * 863 WeChat Pay - 32 characters  * 880 BOKU - 20 characters  * 8580 Qiwi - 255 characters  * 1504 Konbini - 80 characters  All other payment products don't support a descriptor.
      attr_accessor :descriptor

      # The merchantReference is a unique identifier for a payment and can be used for reporting purposes. The merchantReference is required for the execution of a payment and has to be unique. In case a payment has failed the same merchantReference can be used again. Once a successful payment has been made the same merchantReference can no longer be used and will be rejected. 
      attr_accessor :merchant_reference

      # It allows you to store additional parameters for the transaction in JSON format. This field must not contain any personal data.
      attr_accessor :merchant_parameters

      # Attribute mapping from ruby-style variable name to JSON key.
      def self.attribute_map
        {
          :'descriptor' => :'descriptor',
          :'merchant_reference' => :'merchantReference',
          :'merchant_parameters' => :'merchantParameters'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.openapi_types
        {
          :'descriptor' => :'String',
          :'merchant_reference' => :'String',
          :'merchant_parameters' => :'String'
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
          fail ArgumentError, "The input argument (attributes) must be a hash in `References` initialize method"
        end

        # check to see if the attribute exists and convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `References`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'descriptor')
          self.descriptor = attributes[:'descriptor']
        end

        if attributes.key?(:'merchant_reference')
          self.merchant_reference = attributes[:'merchant_reference']
        else
          self.merchant_reference = nil
        end

        if attributes.key?(:'merchant_parameters')
          self.merchant_parameters = attributes[:'merchant_parameters']
        end
      end

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            descriptor == o.descriptor &&
            merchant_reference == o.merchant_reference &&
            merchant_parameters == o.merchant_parameters
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [descriptor, merchant_reference, merchant_parameters].hash
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
