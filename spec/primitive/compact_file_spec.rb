# typed: false
# frozen_string_literal: true

require 'spec_helper'
require 'person'

describe Primitive::CompactFile do
  subject(:repository) { described_class.new(permitted_classes: [Person]) }

  let(:person) { Person.new(name) }
  let(:name) { 'p1234' }
  let(:path) { File.join(TEMP_DIR, "#{SecureRandom.uuid}.yaml") }

  describe '#save' do
    it 'returns path as the id' do
      returned_path = repository.save(person, path)

      expect(returned_path).to eq(path)
    end

    it 'writes to disk' do
      repository.save(person, path)

      expected_contents = "--- !ruby/object:Person\nid: #{path}\nname: p1234\n"

      expect(read(path)).to eq(expected_contents)
    end
  end

  describe '#load' do
    let(:entity_path) { fixture_path('entity.yaml') }

    it 'hydrates entity id from disk' do
      entity = repository.retrieve(entity_path)

      expect(entity.id).to eq(entity_path)
    end

    it 'hydrates entity property from disk' do
      entity = repository.retrieve(entity_path)

      expect(entity.name).to eq(name)
    end
  end
end
