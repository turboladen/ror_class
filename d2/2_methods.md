!SLIDE center just-title
# Methods

!SLIDE
# What are they?

* Little bits of functionality.
* Called from "outside" of the object.
* Give access to the state of the object ("inside").
* Can behave like functions.


!SLIDE bullets
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

* The `puts` output isn't very helpful, right?  Let's fix that.

!SLIDE
# Our First (Real) Method

* Let's make `Song` do something.
* Update your class with this method:

```ruby
class Song
  # (existing code)
  def to_s
    output = "Title: #{@title}\n"
    output << "Artist: #{@artist}\n"
    output << "Album: #{@album}\n"
    output << "Track: #{@track}\n"

    output
  end
end
```

!SLIDE bullets
# Try it out

```ruby
001:0> song = Song.new
002:0> song.title = "My Favorite Things"
003:0> song.artist = "John Coltrane"
003:0> song.album = "My Favorite Things"
004:0> song.track = 1
005:0> puts song
```

* A little more useful, ya?

!SLIDE smbullets
# Ok, what's going on here?

* String interpolation: `"Title: #{@title}"`
    * Similar to: `"Title: " + @title`
* `\n` = newline character.
* `<<` = [append/concatenate](http://rdoc.info/stdlib/core/String#%3C%3C-instance_method).
* The last, lonely `output` returns the full String.
* `puts` prints, but calls `#to_s` on the object before printing out.
* We _redefined_ `#to_s` for our purposes!

!SLIDE smbullets
# `puts`

* Where does that come from?
    * [Kernel#puts](http://rdoc.info/stdlib/core/Kernel#puts-instance_method)

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
