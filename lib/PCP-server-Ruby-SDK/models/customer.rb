
require 'date'
require 'time'
module PCPServerSDK
  module Models
    # Object containing the details of a customer. 
    class Customer
      attr_accessor :company_information

      # Unique identifier for the customer.
      attr_accessor :merchant_customer_id

      attr_accessor :billing_address

      attr_accessor :contact_details

      # Fiscal registration number of the customer or the tax registration number of the company for a business customer. Please find below specifics per country:  * Brazil - Consumer (CPF) with a length of 11 digits  * Brazil - Company (CNPJ) with a length of 14 digits  * Denmark - Consumer (CPR-nummer or personnummer) with a length of 10 digits  * Finland - Consumer (Finnish: henkilötunnus (abbreviated as HETU), Swedish: personbeteckning) with a length of 11 characters  * Norway - Consumer (fødselsnummer) with a length of 11 digits  * Sweden - Consumer (personnummer) with a length of 10 or 12 digits
      attr_accessor :fiscal_number

      # Business relation to the customer. Possible values:         * B2C - Indicates business to consumer * B2B - Indicates business to business  Mandatory for the the following payment methods: * 3390 - PAYONE Secured Invoice * 3391 - PAYONE Secured Installment * 3392 - PAYONE Secured Direct Debit
      attr_accessor :business_relation

      # The locale that the customer should be addressed in (for 3rd parties).   Note: Only the language code is supported.
      attr_accessor :locale

      attr_accessor :personal_information

      # Attribute mapping from ruby-style variable name to JSON key.
      def self.attribute_map
        {
          :'company_information' => :'companyInformation',
          :'merchant_customer_id' => :'merchantCustomerId',
          :'billing_address' => :'billingAddress',
          :'contact_details' => :'contactDetails',
          :'fiscal_number' => :'fiscalNumber',
          :'business_relation' => :'businessRelation',
          :'locale' => :'locale',
          :'personal_information' => :'personalInformation'
        }
      end

      # Returns all the JSON keys this model knows about
      def self.acceptable_attributes
        attribute_map.values
      end

      # Attribute type mapping.
      def self.openapi_types
        {
          :'company_information' => :'CompanyInformation',
          :'merchant_customer_id' => :'String',
          :'billing_address' => :'Address',
          :'contact_details' => :'ContactDetails',
          :'fiscal_number' => :'String',
          :'business_relation' => :'String',
          :'locale' => :'String',
          :'personal_information' => :'PersonalInformation'
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
          fail ArgumentError, "The input argument (attributes) must be a hash in `Customer` initialize method"
        end

        # check to see if the attribute exists and convert string to symbol for hash key
        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `Customer`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'company_information')
          self.company_information = attributes[:'company_information']
        end

        if attributes.key?(:'merchant_customer_id')
          self.merchant_customer_id = attributes[:'merchant_customer_id']
        end

        if attributes.key?(:'billing_address')
          self.billing_address = attributes[:'billing_address']
        end

        if attributes.key?(:'contact_details')
          self.contact_details = attributes[:'contact_details']
        end

        if attributes.key?(:'fiscal_number')
          self.fiscal_number = attributes[:'fiscal_number']
        end

        if attributes.key?(:'business_relation')
          self.business_relation = attributes[:'business_relation']
        end

        if attributes.key?(:'locale')
          self.locale = attributes[:'locale']
        end

        if attributes.key?(:'personal_information')
          self.personal_information = attributes[:'personal_information']
        end
      end

      # Checks equality by comparing each attribute.
      # @param [Object] Object to be compared
      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
            company_information == o.company_information &&
            merchant_customer_id == o.merchant_customer_id &&
            billing_address == o.billing_address &&
            contact_details == o.contact_details &&
            fiscal_number == o.fiscal_number &&
            business_relation == o.business_relation &&
            locale == o.locale &&
            personal_information == o.personal_information
      end

      # @see the `==` method
      # @param [Object] Object to be compared
      def eql?(o)
        self == o
      end

      # Calculates hash code according to all attributes.
      # @return [Integer] Hash code
      def hash
        [company_information, merchant_customer_id, billing_address, contact_details, fiscal_number, business_relation, locale, personal_information].hash
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
