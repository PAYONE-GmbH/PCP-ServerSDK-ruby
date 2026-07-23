require 'date'
require 'time'
require 'set'

module PCPServerSDK
  module Models
    class ModelBase
      @attribute_map = {}
      @openapi_types = {}
      @attribute_defaults = {}
      @attribute_enums = {}

      class << self
        def inherited(subclass)
          subclass.instance_variable_set(:@attribute_map, attribute_map.dup)
          subclass.instance_variable_set(:@openapi_types, openapi_types.dup)
          subclass.instance_variable_set(:@attribute_defaults, attribute_defaults.dup)
          subclass.instance_variable_set(:@attribute_enums, attribute_enums.dup)
          super
        end

        def attribute(name, json_name, type, default: nil, enum: nil)
          define_method(name) { instance_variable_get("@#{name}") }
          define_method("#{name}=") do |value|
            allowed_values = self.class.attribute_enums[name]
            if !value.nil? && allowed_values && !allowed_values.include?(value)
              raise ArgumentError, "invalid value for \"#{name}\", must be one of #{allowed_values.inspect}."
            end

            instance_variable_set("@#{name}", value)
          end
          @attribute_map[name] = json_name
          @openapi_types[name] = type
          @attribute_defaults[name] = default unless default.nil?
          @attribute_enums[name] = enum if enum
        end

        def attribute_map
          @attribute_map
        end

        def openapi_types
          @openapi_types
        end

        def attribute_defaults
          @attribute_defaults
        end

        def attribute_enums
          @attribute_enums
        end

        def acceptable_attributes
          attribute_map.values
        end

        def openapi_nullable
          Set.new
        end

        def build_from_hash(attributes)
          return nil unless attributes.is_a?(Hash)

          values = attributes.each_with_object({}) { |(key, value), result| result[key.to_s] = value }
          new(openapi_types.each_with_object({}) do |(name, type), result|
            json_name = attribute_map[name].to_s
            result[name] = values.key?(json_name) ? _deserialize(type, values[json_name]) : nil if values.key?(json_name)
          end)
        end

        def _deserialize(type, value)
          return nil if value.nil?

          type_name = type.to_s

          case type_name
          when 'Time' then Time.parse(value)
          when 'Date' then Date.parse(value)
          when 'String' then value.to_s
          when 'Integer' then value.to_i
          when 'Float' then value.to_f
          when 'Boolean' then value.to_s.match?(/\A(true|t|yes|y|1)\z/i)
          when 'Object' then value
          when /\AArray<(?<inner_type>.+)>\z/
            inner_type = Regexp.last_match[:inner_type]
            value.map { |item| _deserialize(inner_type, item) }
          when /\AHash<(?<key_type>.+?), (?<value_type>.+)>\z/
            key_type = Regexp.last_match[:key_type]
            value_type = Regexp.last_match[:value_type]
            value.each_with_object({}) do |(key, item), result|
              result[_deserialize(key_type, key)] = _deserialize(value_type, item)
            end
          else
            klass = PCPServerSDK::Models.const_get(type_name)
            klass.respond_to?(:openapi_any_of) || klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
          end
        end
      end

      def initialize(attributes = {})
        raise ArgumentError, "The input argument must be a hash" unless attributes.is_a?(Hash)

        self.class.attribute_defaults.each { |name, value| public_send("#{name}=", value) }
        attributes.each do |name, value|
          name = name.to_sym
          raise ArgumentError, "`#{name}` is not a valid attribute" unless self.class.attribute_map.key?(name)

          public_send("#{name}=", value)
        end
      end

      def ==(other)
        self.class == other.class && self.class.attribute_map.keys.all? { |name| public_send(name) == other.public_send(name) }
      end

      alias eql? ==

      def hash
        self.class.attribute_map.keys.map { |name| public_send(name) }.hash
      end

      def to_s
        to_hash.to_s
      end

      def to_hash
        self.class.attribute_map.each_with_object({}) do |(name, json_name), result|
          value = public_send(name)
          result[json_name] = to_value(value) unless value.nil?
        end
      end

      alias to_body to_hash

      private

        def to_value(value)
          return value.compact.map { |item| to_value(item) } if value.is_a?(Array)
          return value.transform_values { |item| to_value(item) } if value.is_a?(Hash)
          return value.to_hash if value.respond_to?(:to_hash)

          value
        end
    end
  end
end
