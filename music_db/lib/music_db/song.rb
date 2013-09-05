require_relative 'yamlable'


class MusicDB::Song
  include MusicDB::YAMLable

  attr_accessor :title, :artist, :album, :track

  def initialize(title, artist, album=nil, track=nil)
    @title = title
    @artist = artist
    @album = album
    @track = track
  end

  def to_s
    output = "title: #{@title}\n"
    output << "artist: #{@artist}\n"
    output << "album: #{@album}\n"
    output << "track: #{@track}\n"

    output
  end

  def attributes
    {
      title: @title,
      artist: @artist,
      album: @album,
      track: @track
    }
  end
end
