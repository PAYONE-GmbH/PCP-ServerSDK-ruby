module PCPServerSDK
  # Base for all objects that are exchanged between the SDK and PCP API. This class serves as an abstract base class, as every models needs to implement marshalling and unmarshalling.
  class ApiModel
    # Returns the ApiModel as a hash
    # @abstract
    # @return [Hash]
    def to_hash
      raise NotImplementedError, "#{self.class.name} has not implemented method '#{__method__}'"
    end

    # Takes a hash representation the object and sets its fields
    # This exists because its easier to access internals in an actual method
    # @abstract
    # @param hash [Hash] possible hash representation of the object
    def from_hash(hash)
      raise NotImplementedError, "#{self.class.name} has not implemented method '#{__method__}'"
    end

    # @return [String] String representation of the object
    def to_s
      to_hash.to_s
    end

    # Convert a hash representation to an instance of the ApiModel. The input should be a Hash
    # otherwise a TypeError is thrown
    #
    # @param hash [Object] possible hash representation of the API entity
    # @return [self]
    def self.new_from_hash(hash)
      raise TypeError, "value '#{hash}' is not a hash" unless hash.is_a? Hash
      obj = self.new
      obj.from_hash(hash)
      obj
    end

    # Convert an array of hash representations to an array of instances of the ApiModel. The input should be an Array
    # otherwise a TypeError is thrown
    #
    # @param values [Object] possible array of hash representations of the API entity
    # @return [Array<self>]
    def self.new_from_hash_array(values)
      raise TypeError, "value is a #{values.class.name} not #{Array.class.name}" unless values.is_a? Array
      values.map { |hash| self.new_from_hash(hash) }
    end
  end
end
