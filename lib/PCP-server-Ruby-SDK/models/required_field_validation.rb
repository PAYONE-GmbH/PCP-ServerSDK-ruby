require 'date'
require 'psych'
require 'set'

module PCPServerSDK
  module Models
    module RequiredFieldValidation
      SCHEMA_PATH = File.expand_path('../../../api-definition.yaml', __dir__)

      class << self
        def install!
          required_attributes_by_class.each do |class_name, required_attributes|
            next unless PCPServerSDK::Models.const_defined?(class_name, false)

            klass = PCPServerSDK::Models.const_get(class_name)
            next unless klass.is_a?(Class)
            next if klass < Array
            next unless klass.respond_to?(:attribute_map)
            next if klass.instance_variable_defined?(:@required_field_validation_installed)

            klass.prepend(build_validation_module(required_attributes))
            klass.singleton_class.prepend(build_class_validation_module)
            klass.instance_variable_set(:@required_field_validation_installed, true)
          end
        end

        private

          def build_validation_module(required_attributes)
            Module.new do
              define_method(:initialize) do |attributes = {}|
                @required_field_validation_initializing = true
                initialization_succeeded = false

                begin
                  super(attributes)
                  initialization_succeeded = true
                ensure
                  @required_field_validation_initializing = false
                end

                if initialization_succeeded && attributes.is_a?(Hash) && !attributes.empty?
                  validate_required_fields!
                end
              end

              define_method(:validate_required_fields!) do
                missing_attributes = required_attributes.select { |attribute| public_send(attribute).nil? }
                return if missing_attributes.empty?

                raise ArgumentError, "#{missing_attributes.first} cannot be nil"
              end

              define_method(:to_hash) do
                validate_required_fields!
                super()
              end

              required_attributes.each do |attribute|
                define_method("#{attribute}=") do |value|
                  if value.nil? && !@required_field_validation_initializing
                    raise ArgumentError, "#{attribute} cannot be nil"
                  end

                  super(value)
                end
              end
            end
          end
          def build_class_validation_module
            Module.new do
              def build_from_hash(attributes)
                object = super(attributes)
                return object if object.nil?
                return object if object.is_a?(Array)

                object.send(:validate_required_fields!) if object.respond_to?(:validate_required_fields!, true)
                object
              end
            end
          end

          def required_attributes_by_class
            @required_attributes_by_class ||= begin
              spec = Psych.safe_load_file(SCHEMA_PATH, permitted_classes: [Time, Date, Symbol], aliases: true)
              schemas = spec.dig('components', 'schemas') || {}

              schemas.each_with_object({}) do |(schema_name, schema), mapping|
                required_properties = Array(schema['required'])
                next if required_properties.empty?
                next unless PCPServerSDK::Models.const_defined?(schema_name, false)

                klass = PCPServerSDK::Models.const_get(schema_name)
                next unless klass.is_a?(Class)
                next unless klass.respond_to?(:attribute_map)

                attribute_map = klass.attribute_map.invert
                required_attributes = required_properties.filter_map { |property| attribute_map[property.to_sym] }
                next if required_attributes.empty?

                mapping[schema_name] = required_attributes.freeze
              end.freeze
            end
          end
      end
    end
  end
end
