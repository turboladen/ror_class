require_relative 'yamlable'

class MusicDB::Album
  include MusicDB::YAMLable

  attr_accessor :title, :artist, :year
end
