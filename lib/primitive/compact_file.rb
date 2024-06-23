# typed: strict
# frozen_string_literal: true

require_relative 'repository'

module Primitive
  # Knows how to load and save an Entity from/to local disk to a single file.
  # YAML serialization will be used so in order to safely deserialize, the list of
  # permitted classes that can be serialized must be specified.
  class CompactFile
    extend T::Sig
    include Repository

    sig { returns(T::Array[T::Class[T.anything]]) }
    attr_reader :permitted_classes

    sig { params(permitted_classes: T::Array[T::Class[T.anything]]).void }
    def initialize(permitted_classes: [Primitive::Entity])
      @permitted_classes = permitted_classes
    end

    sig { override.params(entity: Primitive::Entity, id: T.nilable(String)).returns(String) }
    def save(entity, id = nil)
      raise ArgumentError, 'id is required' unless id

      FileUtils.mkdir_p(File.dirname(id))

      entity.send('id=', id)

      File.write(id, serialize(entity))

      id
    end

    sig { override.params(id: String).returns(Primitive::Entity) }
    def retrieve(id)
      deserialize(File.read(id)).tap do |entity|
        entity.send('id=', id)
      end
    end

    private

    sig { overridable.params(entity: Primitive::Entity).returns(String) }
    def serialize(entity)
      StringIO.new.tap do |io|
        YAML.dump(entity, io)
      end.string
    end

    sig { overridable.params(string: String).returns(Primitive::Entity) }
    def deserialize(string)
      YAML.load(
        string,
        permitted_classes:,
        aliases: true
      )
    end
  end
end
