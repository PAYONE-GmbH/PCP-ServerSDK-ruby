
require 'date'
require 'time'
module PCPServerSDK
  module Models
    # Object containing the specific input details for card payments. 
    class CardPaymentMethodSpecificInput
      attr_accessor :authorization_mode

      attr_accessor :recurring

      # ID of the token to use to create the payment.
      attr_accessor :payment_processing_token

      # Token to identify the card in the reporting.
      attr_accessor :reporting_token

      attr_accessor :transaction_channel

      attr_accessor :unscheduled_card_on_file_requestor

      attr_accessor :unscheduled_card_on_file_sequence_indicator

      # Payment product identifier - please check product documentation for a full overview of possible values.
      attr_accessor :payment_product_id

      attr_accessor :card

      # The URL that the customer is redirect to after the payment flow has finished. You can add any number of key value pairs in the query string that, for instance help you to identify the customer when they return to your site. Please note that we will also append some additional key value pairs that will also help you with this identification process. Note: The provided URL should be absolute and contain the protocol to use, e.g. http:// or https://. For use on mobile devices a custom protocol can be used in the form of protocol://. This protocol must be registered on the device first. URLs without a protocol will be rejected.
      attr_accessor :return_url

      # Period of payment occurrence for recurring and installment payments. Allowed values: * Yearly * Quarterly * Monthly  * Weekly * Daily Supported soon
      attr_accessor :card_on_file_recurring_frequency

      # The end date of the last scheduled payment in a series of transactions. Format YYYYMMDD Supported soon
      attr_accessor :card_on_file_recurring_expiration

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
          :'authorization_mode' => :'authorizationMode',
          :'recurring' => :'recurring',
          :'payment_processing_token' => :'paymentProcessingToken',
          :'reporting_token' => :'reportingToken',
          :'transaction_channel' => :'transactionChannel',
          :'unscheduled_card_on_file_requestor' => :'unscheduledCardOnFileRequestor',
          :'unscheduled_card_on_file_sequence_indicator' => :'unscheduledCardOnFileSequenceIndicator',
          :'payment_product_id' => :'paymentProductId',
          :'card' => :'card',
          :'return_url' => :'returnUrl',
          :'card_on_file_recurring_frequency' => :'cardOnFileRecurringFrequency',
          :'card_on_file_recurring_expiration' => :'cardOnFileRecurringExpiration'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.openapi_types
        {
          :'authorization_mode' => :'AuthorizationMode',
          :'recurring' => :'CardRecurrenceDetails',
          :'payment_processing_token' => :'String',
          :'reporting_token' => :'String',
          :'transaction_channel' => :'TransactionChannel',
          :'unscheduled_card_on_file_requestor' => :'UnscheduledCardOnFileRequestor',
          :'unscheduled_card_on_file_sequence_indicator' => :'UnscheduledCardOnFileSequenceIndicator',
          :'payment_product_id' => :'Integer',
          :'card' => :'CardInfo',
          :'return_url' => :'String',
          :'card_on_file_recurring_frequency' => :'String',
          :'card_on_file_recurring_expiration' => :'String'
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
          fail ArgumentError, "The input argument (attributes) must be a hash in `CardPaymentMethodSpecificInput` initialize method"
        end

        # check to see if the attribute exists and convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `CardPaymentMethodSpecificInput`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'authorization_mode')
          self.authorization_mode = attributes[:'authorization_mode']
        end

        if attributes.key?(:'recurring')
          self.recurring = attributes[:'recurring']
        end

        if attributes.key?(:'payment_processing_token')
          self.payment_processing_token = attributes[:'payment_processing_token']
        end

        if attributes.key?(:'reporting_token')
          self.reporting_token = attributes[:'reporting_token']
        end

        if attributes.key?(:'transaction_channel')
          self.transaction_channel = attributes[:'transaction_channel']
        end

        if attributes.key?(:'unscheduled_card_on_file_requestor')
          self.unscheduled_card_on_file_requestor = attributes[:'unscheduled_card_on_file_requestor']
        end

        if attributes.key?(:'unscheduled_card_on_file_sequence_indicator')
          self.unscheduled_card_on_file_sequence_indicator = attributes[:'unscheduled_card_on_file_sequence_indicator']
        end

        if attributes.key?(:'payment_product_id')
          self.payment_product_id = attributes[:'payment_product_id']
        end

        if attributes.key?(:'card')
          self.card = attributes[:'card']
        end

        if attributes.key?(:'return_url')
          self.return_url = attributes[:'return_url']
        end

        if attributes.key?(:'card_on_file_recurring_frequency')
          self.card_on_file_recurring_frequency = attributes[:'card_on_file_recurring_frequency']
        end

        if attributes.key?(:'card_on_file_recurring_expiration')
          self.card_on_file_recurring_expiration = attributes[:'card_on_file_recurring_expiration']
        end
      end

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            authorization_mode == o.authorization_mode &&
            recurring == o.recurring &&
            payment_processing_token == o.payment_processing_token &&
            reporting_token == o.reporting_token &&
            transaction_channel == o.transaction_channel &&
            unscheduled_card_on_file_requestor == o.unscheduled_card_on_file_requestor &&
            unscheduled_card_on_file_sequence_indicator == o.unscheduled_card_on_file_sequence_indicator &&
            payment_product_id == o.payment_product_id &&
            card == o.card &&
            return_url == o.return_url &&
            card_on_file_recurring_frequency == o.card_on_file_recurring_frequency &&
            card_on_file_recurring_expiration == o.card_on_file_recurring_expiration
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [authorization_mode, recurring, payment_processing_token, reporting_token, transaction_channel, unscheduled_card_on_file_requestor, unscheduled_card_on_file_sequence_indicator, payment_product_id, card, return_url, card_on_file_recurring_frequency, card_on_file_recurring_expiration].hash
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
