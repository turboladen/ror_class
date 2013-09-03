require_relative 'yamlable'

class MusicDB::Album
  include YAMLable

  attr_accessor :title, :artist, :year
end
