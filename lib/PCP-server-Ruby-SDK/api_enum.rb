module PCPServerSDK
  class ApiEnum
    # returns a list of allowed values for the enum
    # @return [Array<String>]
    def self.values
      @enum_values ||= self.constants.map { |sym| self.const_get(sym, inherit: false) }
      @enum_values
    end

    # Check if a value is from the set of allowed values and returns it.
    # If the value is not from the set of allowed values a TypeError is thrown.
    # @param value [String]
    # @return [String]
    def self.validate(value)
      raise TypeError, "'#{value}' is not a valid value from #{self.class.name}" unless values.include? value 
      value
    end

    # Check if all values in an array are from the set of allowed values and returns it.
    # If any value is not from the set of allowed values a TypeError is thrown.
    # @param values [Array<String>]
    # @return [Array<String>]
    def self.validate_array(values)
      raise TypeError, "value is a #{values.class.name} not #{Array.class.name}" unless values.is_a? Array
      values.map { |value| self.validate(value) }
    end
  end
end
