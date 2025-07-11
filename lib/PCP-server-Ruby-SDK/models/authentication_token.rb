# frozen_string_literal: true

require 'json'
require 'date'
require 'securerandom'

module PCPServerSDK
  module Models
    # Model for the authentication JWT token response
    class AuthenticationToken
      attr_accessor :token
      attr_accessor :id
      attr_accessor :creation_date
      attr_accessor :expiration_date

      def self.attribute_map
        {
          :'token' => :'token',
          :'id' => :'id',
          :'creation_date' => :'creationDate',
          :'expiration_date' => :'expirationDate'
        }
      end

      def self.acceptable_attributes
        attribute_map.values
      end

      def self.openapi_types
        {
          :'token' => :'String',
          :'id' => :'String',
          :'creation_date' => :'Time',
          :'expiration_date' => :'Time'
        }
      end

      def self.openapi_nullable
        Set.new([])
      end

      def initialize(attributes = {})
        if (!attributes.is_a?(Hash))
          fail ArgumentError, "The input argument (attributes) must be a hash in `AuthenticationToken` initialize method"
        end

        attributes = attributes.each_with_object({}) { |(k, v), h|
          if (!self.class.attribute_map.key?(k.to_sym))
            fail ArgumentError, "`#{k}` is not a valid attribute in `AuthenticationToken`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
          end
          h[k.to_sym] = v
        }

        if attributes.key?(:'token')
          self.token = attributes[:'token']
        end

        if attributes.key?(:'id')
          self.id = attributes[:'id']
        end

        if attributes.key?(:'creation_date')
          self.creation_date = attributes[:'creation_date'].is_a?(String) ? Time.parse(attributes[:'creation_date']) : attributes[:'creation_date']
        end

        if attributes.key?(:'expiration_date')
          self.expiration_date = attributes[:'expiration_date'].is_a?(String) ? Time.parse(attributes[:'expiration_date']) : attributes[:'expiration_date']
        end
      end

      def self.from_json(json_str)
        data = JSON.parse(json_str)
        new(data)
      end

      def self.build_from_hash(attributes)
        return nil unless attributes.is_a?(Hash)
        attributes = attributes.transform_keys(&:to_sym)
        transformed_hash = {}
        openapi_types.each_pair do |key, type|
          if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
            transformed_hash[key] = nil
          elsif type =~ /\AArray<(.*)>/i
            if attributes[attribute_map[key]].is_a?(Array)
              transformed_hash[key] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
            end
          elsif !attributes[attribute_map[key]].nil?
            transformed_hash[key] = _deserialize(type, attributes[attribute_map[key]])
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
        when /\AArray<(?<inner_type>.+)>/i
          inner_type = Regexp.last_match[:inner_type]
          value.map { |v| _deserialize(inner_type, v) }
        when /\AHash<(?<k_type>.+?), (?<v_type>.+)>/i
          k_type = Regexp.last_match[:k_type]
          v_type = Regexp.last_match[:v_type]
          {}.tap do |hash|
            value.each do |k, v|
              hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
            end
          end
        else
          # models (e.g. Pet) or oneOf
          if PCPServerSDK::Models.const_defined?(type)
            klass = PCPServerSDK::Models.const_get(type)
            klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
          else
            value
          end
        end
      end

      def ==(o)
        return true if self.equal?(o)
        self.class == o.class &&
          token == o.token &&
          id == o.id &&
          creation_date == o.creation_date &&
          expiration_date == o.expiration_date
      end

      def eql?(o)
        self == o
      end

      def hash
        [token, id, creation_date, expiration_date].hash
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
            next if !is_nullable || (is_nullable && !instance_variable_defined?("@#{attr}"))
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
