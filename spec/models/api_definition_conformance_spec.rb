require 'spec_helper'
require 'yaml'
require_relative '../../lib/PCP-server-Ruby-SDK'

RSpec.describe 'OpenAPI model conformance' do
  let(:schemas) { YAML.unsafe_load_file(File.expand_path('../../api-definition.yaml', __dir__))['components']['schemas'] }

  def schema_properties(name)
    schema_properties_from(schemas.fetch(name))
  end

  def schema_properties_from(schema)
    inherited = Array(schema['allOf']).flat_map do |parent|
      parent['$ref'] ? schema_properties(parent['$ref'].split('/').last) : schema_properties_from(parent)
    end
    inherited + schema.fetch('properties', {}).keys
  end

  it 'provides a model for every object schema' do
    object_schemas = schemas.select { |_name, schema| schema['type'] == 'object' }.keys
    missing = object_schemas.reject { |name| PCPServerSDK::Models.const_defined?(name, false) }

    expect(missing).to be_empty
  end

  it 'maps every flattened schema property' do
    mismatches = schemas.filter_map do |name, schema|
      next unless schema['type'] == 'object'

      model = PCPServerSDK::Models.const_get(name)
      expected = schema_properties(name).sort
      actual = model.attribute_map.values.map(&:to_s).sort
      "#{name}: expected #{expected}, got #{actual}" unless actual == expected
    end

    expect(mismatches).to be_empty
  end

  it 'declares each direct allOf parent' do
    mismatches = schemas.filter_map do |name, schema|
      expected = Array(schema['allOf']).filter_map { |parent| parent['$ref']&.split('/')&.last }.sort
      next if expected.empty?

      model = PCPServerSDK::Models.const_get(name)
      actual = model.respond_to?(:openapi_all_of) ? model.openapi_all_of.map(&:to_s).sort : []
      "#{name}: expected #{expected}, got #{actual}" unless actual == expected
    end

    expect(mismatches).to be_empty
  end

  it 'uses each direct allOf parent as its Ruby superclass' do
    mismatches = schemas.filter_map do |name, schema|
      parents = Array(schema['allOf']).filter_map { |parent| parent['$ref']&.split('/')&.last }
      next unless parents.size == 1

      model = PCPServerSDK::Models.const_get(name)
      parent = PCPServerSDK::Models.const_get(parents.first)
      "#{name}: expected #{parent}, got #{model.superclass}" unless model.superclass == parent
    end

    expect(mismatches).to be_empty
  end

  it 'inherits parent attribute accessors instead of redeclaring them' do
    mismatches = schemas.filter_map do |name, schema|
      parents = Array(schema['allOf']).filter_map { |parent| parent['$ref']&.split('/')&.last }
      next unless parents.size == 1

      model = PCPServerSDK::Models.const_get(name)
      parent = PCPServerSDK::Models.const_get(parents.first)
      redeclared = parent.attribute_map.keys.select do |attribute|
        model.instance_method(attribute).owner == model
      end
      "#{name}: redeclares #{redeclared}" unless redeclared.empty?
    end

    expect(mismatches).to be_empty
  end
end
