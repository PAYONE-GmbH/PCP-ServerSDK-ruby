# Regenerates eligible object model files from `api-definition.yaml` as concise
# `ModelBase` subclasses. Use this after an API-definition update or when the
# generated model layer needs to be brought back to the shared ModelBase style.
#
# The script rewrites eligible files in `lib/PCP-server-Ruby-SDK/models`; it is
# not a read-only audit. It intentionally excludes `oneOf`/`anyOf` schemas and
# keeps direct Ruby inheritance for single-parent `allOf` schemas. Attribute
# names, types, defaults, enums, and inheritance are derived from the API
# definition, making it the source of truth. Output filenames follow the Ruby
# naming convention, with documented exceptions for legacy filenames.
# Referenced object, composed, and enum schemas remain model types; only plain
# primitive aliases are converted to their Ruby primitive type.
#
# Running it can overwrite manual edits to eligible model files. Run it from a
# clean or understood worktree, then inspect `git diff` and run the full test
# suite before committing. Do not use it to regenerate endpoint clients or
# special composed models; those require manual implementation and review.

require 'pathname'
require 'set'
require 'yaml'

ROOT = Pathname.new(__dir__).parent
MODELS_DIRECTORY = ROOT.join('lib/PCP-server-Ruby-SDK/models')
SCHEMAS = YAML.unsafe_load_file(ROOT.join('api-definition.yaml')).fetch('components').fetch('schemas')
PRIMITIVE_TYPES = {
  'string' => :String,
  'integer' => :Integer,
  'number' => :Float,
  'boolean' => :Boolean
}.freeze
MODEL_FILE_OVERRIDES = {
  # These existing filenames do not follow the class-name conversion convention.
  'MobilePaymentThreeDSecure' => 'mobile_payment_three_dsecure.rb',
  'SepaTransferPaymentProduct772SpecificInput' => 'sepa_transfer_payment_product_772_specific_input.rb'
}.freeze

def direct_parent_name(schema)
  parents = Array(schema['allOf']).filter_map { |item| item['$ref']&.split('/')&.last }
  parents.first if parents.size == 1
end

def local_properties(schema)
  schema.fetch('properties', {}).merge(Array(schema['allOf']).each_with_object({}) do |item, properties|
    properties.merge!(item.fetch('properties', {})) unless item.key?('$ref')
  end)
end

def snake_case(value)
  value.gsub(/([A-Z\d]+)([A-Z][a-z])/, '\\1_\\2')
       .gsub(/([a-z\d])([A-Z])/, '\\1_\\2')
       .tr('-', '_')
       .downcase
end

def model_file(class_name)
  MODELS_DIRECTORY.join(MODEL_FILE_OVERRIDES.fetch(class_name, "#{snake_case(class_name)}.rb"))
end

def ruby_type(schema, resolving = Set.new)
  if schema['$ref']
    name = schema['$ref'].split('/').last
    return name.to_sym if resolving.include?(name)

    referenced_schema = SCHEMAS.fetch(name)
    # Enum references have generated model classes that validate deserialized values.
    return name.to_sym if referenced_schema['type'] == 'object' || referenced_schema.key?('oneOf') || referenced_schema.key?('anyOf') || referenced_schema.key?('enum')

    return ruby_type(referenced_schema, resolving | [name])
  end

  return ruby_type(schema.fetch('allOf').first, resolving) if schema['allOf']&.size == 1
  return "Array<#{ruby_type(schema.fetch('items'), resolving)}>" if schema['type'] == 'array'

  if schema['type'] == 'object' && schema['additionalProperties']
    return "Hash<String, #{ruby_type(schema.fetch('additionalProperties'), resolving)}>"
  end

  return :Date if schema['format'] == 'date'
  return :Time if schema['format'] == 'date-time'

  PRIMITIVE_TYPES.fetch(schema['type'], :Object)
end

def description_lines(description)
  description.to_s.lines.map do |line|
    line.strip.empty? ? '      #' : "      # #{line.strip}"
  end
end

def render_model(class_name, attributes, parent_name)
  superclass = parent_name || 'ModelBase'
  dependency = parent_name ? snake_case(parent_name) : 'model_base'
  output = ["require_relative '#{dependency}'", '', 'module PCPServerSDK', '  module Models', "    class #{class_name} < #{superclass}"]

  attributes.each do |name, json_name, type, property|
    options = []
    options << "default: #{property['default'].inspect}" if property.key?('default')
    options << "enum: #{property['enum'].inspect}" if property.key?('enum')
    output.concat(description_lines(property['description'])) if property.key?('description')
    output << "      attribute #{name.inspect}, #{json_name.inspect}, #{type.inspect}#{", #{options.join(', ')}" unless options.empty?}"
  end

  if parent_name
    output << '' unless attributes.empty?
    output << '      def self.openapi_all_of'
    output << "        [#{parent_name.to_sym.inspect}]"
    output << '      end'
  end

  output.concat(['    end', '  end', 'end', ''])
  output.join("\n")
end

eligible = SCHEMAS.select do |_name, schema|
  schema['type'] == 'object' && !schema.key?('oneOf') && !schema.key?('anyOf')
end

metadata = eligible.transform_values do |schema|
  attributes = local_properties(schema).map do |json_name, property|
    [snake_case(json_name).to_sym, json_name.to_sym, ruby_type(property), property]
  end
  { attributes: attributes, parent_name: direct_parent_name(schema) }
end

metadata.sort.each do |class_name, model_metadata|
  model_file(class_name).write(render_model(class_name, model_metadata.fetch(:attributes), model_metadata.fetch(:parent_name)))
end
