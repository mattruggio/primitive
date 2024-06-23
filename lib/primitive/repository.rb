# typed: strict
# frozen_string_literal: true

module Primitive
  # Defines what a repository class should implement.
  module Repository
    extend T::Sig
    extend T::Helpers

    interface!

    sig { abstract.params(entity: Primitive::Entity, id: T.nilable(String)).returns(String) }
    def save(entity, id = nil); end

    sig { abstract.params(id: String).returns(Primitive::Entity) }
    def retrieve(id); end
  end
end
