
require 'date'
require 'time'

# The Checkout corresponds to the order of the WL API. We do not take additionalInput from the WL API. We have no  shipping and use deliveryAddress instead of address. 
class CheckoutResponse
  # reference to the Commerce Case.
  attr_accessor :commerce_case_id

  # reference to the Checkout.
  attr_accessor :checkout_id

  # Unique identifier for the customer.
  attr_accessor :merchant_customer_id

  attr_accessor :amount_of_money

  attr_accessor :references

  attr_accessor :shipping

  attr_accessor :shopping_cart

  attr_accessor :payment_executions

  attr_accessor :checkout_status

  attr_accessor :status_output

  attr_accessor :payment_information

  # Creation date and time of the Checkout in RFC3339 format. It can either be provided in the request or otherwise will be automatically set to the time when the request CreateCommerceCase was received. Response values will always be in UTC time, but when providing this field in the requests, the time offset can have different formats.  Accepted formats are: * YYYY-MM-DD'T'HH:mm:ss'Z' * YYYY-MM-DD'T'HH:mm:ss+XX:XX * YYYY-MM-DD'T'HH:mm:ss-XX:XX * YYYY-MM-DD'T'HH:mm'Z' * YYYY-MM-DD'T'HH:mm+XX:XX * YYYY-MM-DD'T'HH:mm-XX:XX  All other formats may be ignored by the system. 
  attr_accessor :creation_date_time

  attr_accessor :allowed_payment_actions

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
      :'amount_of_money' => :'amountOfMoney',
      :'references' => :'references',
      :'shipping' => :'shipping',
      :'shopping_cart' => :'shoppingCart',
      :'payment_executions' => :'paymentExecutions',
      :'checkout_status' => :'checkoutStatus',
      :'status_output' => :'statusOutput',
      :'payment_information' => :'paymentInformation',
      :'creation_date_time' => :'creationDateTime',
      :'allowed_payment_actions' => :'allowedPaymentActions'
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
      :'amount_of_money' => :'AmountOfMoney',
      :'references' => :'CheckoutReferences',
      :'shipping' => :'Shipping',
      :'shopping_cart' => :'ShoppingCartResult',
      :'payment_executions' => :'Array<PaymentExecution>',
      :'checkout_status' => :'StatusCheckout',
      :'status_output' => :'StatusOutput',
      :'payment_information' => :'Array<PaymentInformationResponse>',
      :'creation_date_time' => :'Time',
      :'allowed_payment_actions' => :'Array<AllowedPaymentActions>'
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
      fail ArgumentError, "The input argument (attributes) must be a hash in `CheckoutResponse` initialize method"
    end

    # check to see if the attribute exists and convert string to symbol for hash key
    attributes = attributes.each_with_object({}) { |(k, v), h|
      if (!self.class.attribute_map.key?(k.to_sym))
        fail ArgumentError, "`#{k}` is not a valid attribute in `CheckoutResponse`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
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

    if attributes.key?(:'amount_of_money')
      self.amount_of_money = attributes[:'amount_of_money']
    end

    if attributes.key?(:'references')
      self.references = attributes[:'references']
    end

    if attributes.key?(:'shipping')
      self.shipping = attributes[:'shipping']
    end

    if attributes.key?(:'shopping_cart')
      self.shopping_cart = attributes[:'shopping_cart']
    end

    if attributes.key?(:'payment_executions')
      if (value = attributes[:'payment_executions']).is_a?(Array)
        self.payment_executions = value
      end
    end

    if attributes.key?(:'checkout_status')
      self.checkout_status = attributes[:'checkout_status']
    end

    if attributes.key?(:'status_output')
      self.status_output = attributes[:'status_output']
    end

    if attributes.key?(:'payment_information')
      if (value = attributes[:'payment_information']).is_a?(Array)
        self.payment_information = value
      end
    end

    if attributes.key?(:'creation_date_time')
      self.creation_date_time = attributes[:'creation_date_time']
    end

    if attributes.key?(:'allowed_payment_actions')
      if (value = attributes[:'allowed_payment_actions']).is_a?(Array)
        self.allowed_payment_actions = value
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
        amount_of_money == o.amount_of_money &&
        references == o.references &&
        shipping == o.shipping &&
        shopping_cart == o.shopping_cart &&
        payment_executions == o.payment_executions &&
        checkout_status == o.checkout_status &&
        status_output == o.status_output &&
        payment_information == o.payment_information &&
        creation_date_time == o.creation_date_time &&
        allowed_payment_actions == o.allowed_payment_actions
  end

  # @see the `==` method
  # @param [Object] Object to be compared
  def eql?(o)
    self == o
  end

  # Calculates hash code according to all attributes.
  # @return [Integer] Hash code
  def hash
    [commerce_case_id, checkout_id, merchant_customer_id, amount_of_money, references, shipping, shopping_cart, payment_executions, checkout_status, status_output, payment_information, creation_date_time, allowed_payment_actions].hash
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
