
require 'date'
require 'time'

# Object contains information of the payment with a specific payment method.
module PCPServerSDK
  module Models
    class PaymentExecution
      # Unique ID of paymentExecution.
      attr_accessor :payment_execution_id

      # Unique payment transaction identifier of the payment gateway.
      attr_accessor :payment_id

      attr_accessor :card_payment_method_specific_input

      attr_accessor :mobile_payment_method_specific_input

      attr_accessor :redirect_payment_method_specific_input

      attr_accessor :sepa_direct_debit_payment_method_specific_input

      attr_accessor :financing_payment_method_specific_input

      attr_accessor :payment_channel

      attr_accessor :references

      attr_accessor :events



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
          :'payment_execution_id' => :'paymentExecutionId',
          :'payment_id' => :'paymentId',
          :'card_payment_method_specific_input' => :'cardPaymentMethodSpecificInput',
          :'mobile_payment_method_specific_input' => :'mobilePaymentMethodSpecificInput',
          :'redirect_payment_method_specific_input' => :'redirectPaymentMethodSpecificInput',
          :'sepa_direct_debit_payment_method_specific_input' => :'sepaDirectDebitPaymentMethodSpecificInput',
          :'financing_payment_method_specific_input' => :'financingPaymentMethodSpecificInput',
          :'payment_channel' => :'paymentChannel',
          :'references' => :'references',
          :'events' => :'events'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.openapi_types
        {
          :'payment_execution_id' => :'String',
          :'payment_id' => :'String',
          :'card_payment_method_specific_input' => :'CardPaymentMethodSpecificInput',
          :'mobile_payment_method_specific_input' => :'MobilePaymentMethodSpecificInput',
          :'redirect_payment_method_specific_input' => :'RedirectPaymentMethodSpecificInput',
          :'sepa_direct_debit_payment_method_specific_input' => :'SepaDirectDebitPaymentMethodSpecificInput',
          :'financing_payment_method_specific_input' => :'FinancingPaymentMethodSpecificInput',
          :'payment_channel' => :'PaymentChannel',
          :'references' => :'References',
          :'events' => :'Array<PaymentEvent>'
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
          fail ArgumentError, "The input argument (attributes) must be a hash in `PaymentExecution` initialize method"
        end

        # check to see if the attribute exists and convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `PaymentExecution`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'payment_execution_id')
          self.payment_execution_id = attributes[:'payment_execution_id']
        end

        if attributes.key?(:'payment_id')
          self.payment_id = attributes[:'payment_id']
        end

        if attributes.key?(:'card_payment_method_specific_input')
          self.card_payment_method_specific_input = attributes[:'card_payment_method_specific_input']
        end

        if attributes.key?(:'mobile_payment_method_specific_input')
          self.mobile_payment_method_specific_input = attributes[:'mobile_payment_method_specific_input']
        end

        if attributes.key?(:'redirect_payment_method_specific_input')
          self.redirect_payment_method_specific_input = attributes[:'redirect_payment_method_specific_input']
        end

        if attributes.key?(:'sepa_direct_debit_payment_method_specific_input')
          self.sepa_direct_debit_payment_method_specific_input = attributes[:'sepa_direct_debit_payment_method_specific_input']
        end

        if attributes.key?(:'financing_payment_method_specific_input')
          self.financing_payment_method_specific_input = attributes[:'financing_payment_method_specific_input']
        end

        if attributes.key?(:'payment_channel')
          self.payment_channel = attributes[:'payment_channel']
        end

        if attributes.key?(:'references')
          self.references = attributes[:'references']
        end

        if attributes.key?(:'events')
          if (value = attributes[:'events']).is_a?(Array)
            self.events = value
          end
        end
      end

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            payment_execution_id == o.payment_execution_id &&
            payment_id == o.payment_id &&
            card_payment_method_specific_input == o.card_payment_method_specific_input &&
            mobile_payment_method_specific_input == o.mobile_payment_method_specific_input &&
            redirect_payment_method_specific_input == o.redirect_payment_method_specific_input &&
            sepa_direct_debit_payment_method_specific_input == o.sepa_direct_debit_payment_method_specific_input &&
            financing_payment_method_specific_input == o.financing_payment_method_specific_input &&
            payment_channel == o.payment_channel &&
            references == o.references &&
            events == o.events
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [payment_execution_id, payment_id, card_payment_method_specific_input, mobile_payment_method_specific_input, redirect_payment_method_specific_input, sepa_direct_debit_payment_method_specific_input, financing_payment_method_specific_input, payment_channel, references, events].hash
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
