
require 'date'
require 'time'

# Object containing the related data of the created Payment Information.
class PaymentInformationResponse
  # Unique ID of the Commerce Case.
  attr_accessor :commerce_case_id

  # Unique ID of the Commerce Case.
  attr_accessor :checkout_id

  # Unique identifier of the customer.
  attr_accessor :merchant_customer_id

  # Unique ID of the Payment Information.
  attr_accessor :payment_information_id

  attr_accessor :payment_channel

  # Payment product identifier - please check see product documentation for a full overview of possible values.
  attr_accessor :payment_product_id

  # Unique identifier of the POS terminal of the payment transaction.
  attr_accessor :terminal_id

  # Unique ID that identifies a store location or transaction point and which refers to the contract number of the merchant accepting the card.
  attr_accessor :card_acceptor_id

  # Unique reference of the PaymentInformation. In case of card present transactions, the reference from the ECR or terminal will be used. It is always the reference for external transactions. (e.g. card present payments, cash payments or payments processed by other payment providers). 
  attr_accessor :merchant_reference

  attr_accessor :card_payment_details

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
      :'commerce_case_id' => :'commerceCaseId',
      :'checkout_id' => :'checkoutId',
      :'merchant_customer_id' => :'merchantCustomerId',
      :'payment_information_id' => :'paymentInformationId',
      :'payment_channel' => :'paymentChannel',
      :'payment_product_id' => :'paymentProductId',
      :'terminal_id' => :'terminalId',
      :'card_acceptor_id' => :'cardAcceptorId',
      :'merchant_reference' => :'merchantReference',
      :'card_payment_details' => :'cardPaymentDetails',
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
      :'commerce_case_id' => :'String',
      :'checkout_id' => :'String',
      :'merchant_customer_id' => :'String',
      :'payment_information_id' => :'String',
      :'payment_channel' => :'PaymentChannel',
      :'payment_product_id' => :'Integer',
      :'terminal_id' => :'String',
      :'card_acceptor_id' => :'String',
      :'merchant_reference' => :'String',
      :'card_payment_details' => :'CardPaymentDetails',
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
      fail ArgumentError, "The input argument (attributes) must be a hash in `PaymentInformationResponse` initialize method"
    end

    # check to see if the attribute exists and convert string to symbol for hash key
    attributes = attributes.each_with_object({}) { |(k, v), h|
      if (!self.class.attribute_map.key?(k.to_sym))
        fail ArgumentError, "`#{k}` is not a valid attribute in `PaymentInformationResponse`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
      end
      h[k.to_sym] = v
    }

    if attributes.key?(:'commerce_case_id')
      self.commerce_case_id = attributes[:'commerce_case_id']
    end

    if attributes.key?(:'checkout_id')
      self.checkout_id = attributes[:'checkout_id']
    end

    if attributes.key?(:'merchant_customer_id')
      self.merchant_customer_id = attributes[:'merchant_customer_id']
    end

    if attributes.key?(:'payment_information_id')
      self.payment_information_id = attributes[:'payment_information_id']
    end

    if attributes.key?(:'payment_channel')
      self.payment_channel = attributes[:'payment_channel']
    end

    if attributes.key?(:'payment_product_id')
      self.payment_product_id = attributes[:'payment_product_id']
    end

    if attributes.key?(:'terminal_id')
      self.terminal_id = attributes[:'terminal_id']
    end

    if attributes.key?(:'card_acceptor_id')
      self.card_acceptor_id = attributes[:'card_acceptor_id']
    end

    if attributes.key?(:'merchant_reference')
      self.merchant_reference = attributes[:'merchant_reference']
    end

    if attributes.key?(:'card_payment_details')
      self.card_payment_details = attributes[:'card_payment_details']
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
        commerce_case_id == o.commerce_case_id &&
        checkout_id == o.checkout_id &&
        merchant_customer_id == o.merchant_customer_id &&
        payment_information_id == o.payment_information_id &&
        payment_channel == o.payment_channel &&
        payment_product_id == o.payment_product_id &&
        terminal_id == o.terminal_id &&
        card_acceptor_id == o.card_acceptor_id &&
        merchant_reference == o.merchant_reference &&
        card_payment_details == o.card_payment_details &&
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
    [commerce_case_id, checkout_id, merchant_customer_id, payment_information_id, payment_channel, payment_product_id, terminal_id, card_acceptor_id, merchant_reference, card_payment_details, events].hash
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
      klass = const_get(type)
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
