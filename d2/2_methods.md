!SLIDE center just-title
* Methods

!SLIDE
# What are they again?

* Little bits of functionality.
* Called from "outside" of the object.
* Give access to the state of the object ("inside").
* Can behave like functions.


!SLIDE
# Before we move on...

* Try this out in IRB:

```ruby
001:0> song = Song.new
002:0> song.title = "My Favorite Things"
003:0> song.artist = "John Coltrane"
003:0> song.album = "My Favorite Things"
004:0> song.track = 1
005:0> puts song
```

!SLIDE
# Our First (Real) Method

* Let's make `Song` do something.
* Update your class with this method:

```ruby
class Song
  # ...
  def to_s
    output = "Title: #{@title}\n"
    output << "Artist: #{@artist}\n"
    output << "Album: #{@album}\n"
    output << "Track: #{@track}\n"

    output
  end
end
```

!SLIDE
# Try it out

```ruby
001:0> song = Song.new
002:0> song.title = "My Favorite Things"
003:0> song.artist = "John Coltrane"
003:0> song.album = "My Favorite Things"
004:0> song.track = 1
005:0> puts song
```

!SLIDE
# Ok, what's going on here?

* String interpolation: `"Title: #{@title}"`
* `\n` = newline character.
* `<<` = append.
* The last, lonely `output` returns the full String.
* `puts` prints, but calls `#to_s` on the object before printing out.
* We _redefined_ `#to_s` for our purposes!

!SLIDE
# Method Summary

* Defined a method for our `Song`.
* Redefined a built-in method to do what we want.

!SLIDE
# Push to Github

```bash
$ git commit song.rb -m "Added #to_s method"
$ git push origin master
```
