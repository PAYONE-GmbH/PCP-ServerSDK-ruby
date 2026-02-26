require 'date'
require 'time'

# Object containing the specific input details for mobile payments.
module PCPServerSDK
  module Models
    class MobilePaymentMethodSpecificInput
      # Payment product identifier - please check product documentation for a full overview of possible values.
      attr_accessor :payment_product_id

      attr_accessor :authorization_mode

      # The payment data if we will do the decryption of the encrypted payment data. 
      # Typically you'd use encryptedCustomerInput in the root of the create payment request 
      # to provide the encrypted payment data instead.
      attr_accessor :encrypted_payment_data

      # Public Key Hash A unique identifier to retrieve key used by Apple to encrypt information.
      attr_accessor :public_key_hash

      # Ephemeral Key A unique generated key used by Apple to encrypt data.
      attr_accessor :ephemeral_key

      # 3D Secure authentication data
      attr_accessor :three_d_secure

      attr_accessor :payment_product302_specific_input

      attr_accessor :payment_product5002_specific_input

      class EnumAttributeValidator
        attr_reader :datatype
        attr_reader :allowable_values

        def initialize(datatype, allowable_values)
          @allowable_values = allowable_values.map do |value|
            case datatype.to_s
            when /Integer/i
              value.to_i
            when /Float/i
              value.to_f
            else
              value
            end
          end
        end

        def valid?(value)
          !value || allowable_values.include?(value)
        end
      end

      # Attribute mapping from ruby-style variable name to JSON key.
      def self.attribute_map
        {
          :'payment_product_id' => :'paymentProductId',
          :'authorization_mode' => :'authorizationMode',
          :'encrypted_payment_data' => :'encryptedPaymentData',
          :'public_key_hash' => :'publicKeyHash',
          :'ephemeral_key' => :'ephemeralKey',
          :'three_d_secure' => :'threeDSecure',
          :'payment_product302_specific_input' => :'paymentProduct302SpecificInput',
          :'payment_product5002_specific_input' => :'paymentProduct5002SpecificInput'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.openapi_types
        {
          :'payment_product_id' => :'Integer',
          :'authorization_mode' => :'AuthorizationMode',
          :'encrypted_payment_data' => :'String',
          :'public_key_hash' => :'String',
          :'ephemeral_key' => :'String',
          :'three_d_secure' => :'MobilePaymentThreeDSecure',
          :'payment_product302_specific_input' => :'PaymentProduct302SpecificInput',
          :'payment_product5002_specific_input' => :'PaymentProduct5002SpecificInput'
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
          fail ArgumentError, "The input argument (attributes) must be a hash in `MobilePaymentMethodSpecificInput` initialize method"
        end

        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `MobilePaymentMethodSpecificInput`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'payment_product_id')
          self.payment_product_id = attributes[:'payment_product_id']
        end

        if attributes.key?(:'authorization_mode')
          self.authorization_mode = attributes[:'authorization_mode']
        end

        if attributes.key?(:'encrypted_payment_data')
          self.encrypted_payment_data = attributes[:'encrypted_payment_data']
        end

        if attributes.key?(:'public_key_hash')
          self.public_key_hash = attributes[:'public_key_hash']
        end

        if attributes.key?(:'ephemeral_key')
          self.ephemeral_key = attributes[:'ephemeral_key']
        end

        if attributes.key?(:'three_d_secure')
          self.three_d_secure = attributes[:'three_d_secure']
        end

        if attributes.key?(:'payment_product302_specific_input')
          self.payment_product302_specific_input = attributes[:'payment_product302_specific_input']
        end

        if attributes.key?(:'payment_product5002_specific_input')
          self.payment_product5002_specific_input = attributes[:'payment_product5002_specific_input']
        end
      end

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_product_id == o.payment_product_id &&
            authorization_mode == o.authorization_mode &&
            encrypted_payment_data == o.encrypted_payment_data &&
            public_key_hash == o.public_key_hash &&
            ephemeral_key == o.ephemeral_key &&
            three_d_secure == o.three_d_secure &&
            payment_product302_specific_input == o.payment_product302_specific_input &&
            payment_product5002_specific_input == o.payment_product5002_specific_input
      end

      def eql?(o)
        self == o
      end

      def hash
        [payment_product_id, authorization_mode, encrypted_payment_data, public_key_hash, ephemeral_key, three_d_secure, payment_product302_specific_input, payment_product5002_specific_input].hash
      end

      def self.build_from_hash(attributes)
        return nil unless attributes.is_a?(Hash)
        attributes = attributes.transform_keys(&:to_sym)
        transformed_hash = {}
        openapi_types.each_pair do |key, type|
          if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
            transformed_hash["#{key}"] = nil
          elsif type =~ /\AArray<(.*)>/i
            if attributes[attribute_map[key]].is_a?(Array)
              transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
            end
          elsif !attributes[attribute_map[key]].nil?
            transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
          end
        end
        new(transformed_hash)
      end

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
        else
          klass = PCPServerSDK::Models.const_get(type)
          klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
        end
      end

      def to_s
        to_hash.to_s
      end

      def to_body
        to_hash
      end

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
