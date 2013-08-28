class Song
  attr_accessor :title, :artist, :album, :track

  def to_s
    output = "title: #{@title}\n"
    output << "artist: #{@artist}\n"
    output << "album: #{@album}\n"
    output << "track: #{@track}\n"

    output
  end
end
