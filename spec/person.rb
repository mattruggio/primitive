# typed: false
# frozen_string_literal: true

class Person < Primitive::Entity
  attr_reader :name

  def initialize(name)
    super()

    @name = name
  end
end
