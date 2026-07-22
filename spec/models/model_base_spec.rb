require 'spec_helper'
require_relative '../../lib/PCP-server-Ruby-SDK'

module PCPServerSDK
  module Models
    class ModelBaseSpecNestedModel < ModelBase
      attribute :name, :name, :String
    end

    class ModelBaseSpecModel < ModelBase
      attribute :name, :name, :String
      attribute :enabled, :enabled, :Boolean
      attribute :count, :count, :Integer
      attribute :items, :items, 'Array<ModelBaseSpecNestedModel>'
      attribute :metadata, :metadata, 'Hash<String, ModelBaseSpecNestedModel>'
      attribute :nested, :nested, :ModelBaseSpecNestedModel
    end

    class ModelBaseSpecParentModel < ModelBase
      attribute :enabled, :enabled, :Boolean, default: false
      attribute :state, :state, :String, enum: ['ACTIVE']
    end

    class ModelBaseSpecChildModel < ModelBaseSpecParentModel
      attribute :name, :name, :String
    end
  end
end

RSpec.describe PCPServerSDK::Models::ModelBase do
  let(:model_class) { PCPServerSDK::Models::ModelBaseSpecModel }

  it 'deserializes primitives, arrays, hashes, and nested models from JSON hashes' do
    model = model_class.build_from_hash(
      'name' => 'model',
      'enabled' => 'false',
      'count' => '12',
      'items' => [{ 'name' => 'one' }],
      'metadata' => { 'first' => { 'name' => 'two' } },
      'nested' => { 'name' => 'three' }
    )

    expect(model.name).to eq('model')
    expect(model.enabled).to be(false)
    expect(model.count).to eq(12)
    expect(model.items.first.name).to eq('one')
    expect(model.metadata['first'].name).to eq('two')
    expect(model.nested.name).to eq('three')
    expect(model.to_hash).to eq(
      name: 'model', enabled: false, count: 12,
      items: [{ name: 'one' }], metadata: { 'first' => { name: 'two' } }, nested: { name: 'three' }
    )
  end

  it 'preserves nil values from JSON hashes without serializing them' do
    model = model_class.build_from_hash(
      'name' => nil,
      'items' => nil,
      'metadata' => nil,
      'nested' => nil
    )

    expect(model.name).to be_nil
    expect(model.items).to be_nil
    expect(model.metadata).to be_nil
    expect(model.nested).to be_nil
    expect(model.to_hash).to be_empty
  end

  it 'rejects unknown attributes and serializes only assigned values' do
    expect { model_class.new(unknown: true) }.to raise_error(ArgumentError, '`unknown` is not a valid attribute')
    expect(model_class.new(name: 'one').to_hash).to eq(name: 'one')
  end

  it 'drops nil entries from arrays during serialization' do
    model = model_class.new(items: [nil, PCPServerSDK::Models::ModelBaseSpecNestedModel.new(name: 'one')])

    expect(model.to_hash).to eq(items: [{ name: 'one' }])
  end

  it 'inherits defaults and enum validation' do
    model = PCPServerSDK::Models::ModelBaseSpecChildModel.new(name: 'child')

    expect(model.enabled).to be(false)
    expect { model.state = 'INACTIVE' }.to raise_error(ArgumentError, 'invalid value for "state", must be one of ["ACTIVE"].')
  end
end
