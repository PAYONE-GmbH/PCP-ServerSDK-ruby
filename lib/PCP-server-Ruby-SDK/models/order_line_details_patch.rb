
require 'date'
require 'time'

# Object containing additional information that when supplied can have a beneficial effect on the discountrates. 
class OrderLineDetailsPatch
  # Unique identifier of a cart item
  attr_accessor :id

  attr_accessor :status

  # Product or UPC Code
  attr_accessor :product_code

  # The price of one unit of the product, the value should be zero or greater.
  attr_accessor :product_price

  attr_accessor :product_type

  # Quantity of the units being purchased, should be greater than zero Note: Must not be all spaces or all zeros
  attr_accessor :quantity

  # Tax on the line item, with the last two digits implied as decimal places
  attr_accessor :tax_amount

  # URL of the product in shop.   Used for PAYONE Buy Now, Pay Later (BNPL).
  attr_accessor :product_url

  # URL of a product image.   Used for PAYONE Buy Now, Pay Later (BNPL).
  attr_accessor :product_image_url

  # Category path of the item.   Used for PAYONE Buy Now, Pay Later (BNPL).
  attr_accessor :product_category_path

  # Optional parameter to define the delivery shop or touchpoint where an item has been collected (e.g. for Click & Collect or Click & Reserve).
  attr_accessor :merchant_shop_delivery_reference

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
      :'id' => :'id',
      :'status' => :'status',
      :'product_code' => :'productCode',
      :'product_price' => :'productPrice',
      :'product_type' => :'productType',
      :'quantity' => :'quantity',
      :'tax_amount' => :'taxAmount',
      :'product_url' => :'productUrl',
      :'product_image_url' => :'productImageUrl',
      :'product_category_path' => :'productCategoryPath',
      :'merchant_shop_delivery_reference' => :'merchantShopDeliveryReference'
    }
  end

  # Returns all the JSON keys this model knows about
  def self.acceptable_attributes
    attribute_map.values
  end

  # Attribute type mapping.
  def self.openapi_types
    {
      :'id' => :'String',
      :'status' => :'Array<CartItemOrderStatus>',
      :'product_code' => :'String',
      :'product_price' => :'Integer',
      :'product_type' => :'ProductType',
      :'quantity' => :'Integer',
      :'tax_amount' => :'Integer',
      :'product_url' => :'String',
      :'product_image_url' => :'String',
      :'product_category_path' => :'String',
      :'merchant_shop_delivery_reference' => :'String'
    }
  end

  # List of attributes with nullable: true
  def self.openapi_nullable
    Set.new([
    ])
  end

  # List of class defined in allOf (OpenAPI v3)
  def self.openapi_all_of
    [
    :'OrderLineDetailsInput'
    ]
  end

  # Initializes the object
  # @param [Hash] attributes Model attributes in the form of hash
  def initialize(attributes = {})
    if (!attributes.is_a?(Hash))
      fail ArgumentError, "The input argument (attributes) must be a hash in `OrderLineDetailsPatch` initialize method"
    end

    # check to see if the attribute exists and convert string to symbol for hash key
    attributes = attributes.each_with_object({}) { |(k, v), h|
      if (!self.class.attribute_map.key?(k.to_sym))
        fail ArgumentError, "`#{k}` is not a valid attribute in `OrderLineDetailsPatch`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
      end
      h[k.to_sym] = v
    }

    if attributes.key?(:'id')
      self.id = attributes[:'id']
    end

    if attributes.key?(:'status')
      if (value = attributes[:'status']).is_a?(Array)
        self.status = value
      end
    end

    if attributes.key?(:'product_code')
      self.product_code = attributes[:'product_code']
    end

    if attributes.key?(:'product_price')
      self.product_price = attributes[:'product_price']
    else
      self.product_price = nil
    end

    if attributes.key?(:'product_type')
      self.product_type = attributes[:'product_type']
    end

    if attributes.key?(:'quantity')
      self.quantity = attributes[:'quantity']
    else
      self.quantity = nil
    end

    if attributes.key?(:'tax_amount')
      self.tax_amount = attributes[:'tax_amount']
    end

    if attributes.key?(:'product_url')
      self.product_url = attributes[:'product_url']
    end

    if attributes.key?(:'product_image_url')
      self.product_image_url = attributes[:'product_image_url']
    end

    if attributes.key?(:'product_category_path')
      self.product_category_path = attributes[:'product_category_path']
    end

    if attributes.key?(:'merchant_shop_delivery_reference')
      self.merchant_shop_delivery_reference = attributes[:'merchant_shop_delivery_reference']
    end
  end

  # Checks equality by comparing each attribute.
  # @param [Object] Object to be compared
  def ==(o)
    return true if self.equal?(o)
    self.class == o.class &&
        id == o.id &&
        status == o.status &&
        product_code == o.product_code &&
        product_price == o.product_price &&
        product_type == o.product_type &&
        quantity == o.quantity &&
        tax_amount == o.tax_amount &&
        product_url == o.product_url &&
        product_image_url == o.product_image_url &&
        product_category_path == o.product_category_path &&
        merchant_shop_delivery_reference == o.merchant_shop_delivery_reference
  end

  # @see the `==` method
  # @param [Object] Object to be compared
  def eql?(o)
    self == o
  end

  # Calculates hash code according to all attributes.
  # @return [Integer] Hash code
  def hash
    [id, status, product_code, product_price, product_type, quantity, tax_amount, product_url, product_image_url, product_category_path, merchant_shop_delivery_reference].hash
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
