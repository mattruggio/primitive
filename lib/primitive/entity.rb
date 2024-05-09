# typed: strict
# frozen_string_literal: true

module Primitive
  # Base class for uniquely identifiable classes.  Subclasses are simply based on a string-based ID
  # and comparison/sorting/equality will be done in a case-insensitive manner.
  class Entity
    extend T::Sig
    include Comparable

    sig { returns(String) }
    attr_reader :id

    sig { params(id: String).void }
    def initialize(id = '')
      @id = id
    end

    sig { params(other: Entity).returns(T.nilable(Integer)) }
    def <=>(other)
      comparable_id <=> other.comparable_id
    end

    sig { params(other: Entity).returns(T::Boolean) }
    def ==(other)
      comparable_id == other.comparable_id
    end
    alias eql? ==

    sig { returns(Integer) }
    def hash
      comparable_id.hash
    end

    sig { returns(String) }
    def to_s
      id
    end

    sig { returns(String) }
    def comparable_id
      id.upcase
    end

    private

    sig { params(id: String).returns(String) }
    attr_writer :id
  end
end
