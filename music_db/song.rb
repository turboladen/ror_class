require 'yaml'


class Song
  attr_accessor :title, :artist, :album, :track

  def to_s
    output = "title: #{@title}\n"
    output << "artist: #{@artist}\n"
    output << "album: #{@album}\n"
    output << "track: #{@track}\n"

    output
  end

  def to_yaml
    the_song = {
      title: @title,
      artist: @artist,
      album: @album,
      track: @track
    }

    YAML.dump(the_song)
  end

  def dump(filename=nil)
    filename ||= @title
    filename ||= 'unknown'

    File.write("#{filename}.yml", to_yaml)
  end
end
