require_relative 'yamlable'

class Artist
  include YAMLable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def attributes
    { name: @name }
  end
end
