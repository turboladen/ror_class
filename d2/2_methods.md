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
    > song = Song.new
    > song.title = "My Favorite Things"
    > song.artist = "John Coltrane"
    > song.album = "My Favorite Things"
    > song.track = 1
    > puts song
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
> load './song.rg'
> puts song
```

* A little more useful, ya?
* Also: you didn't have to recreate the `song` object to get the new
  functionality!

!SLIDE smbullets
# Ok, what's going on here?

* String interpolation: `"Title: #{@title}"`
    * Similar to: `"Title: " + @title`
* `\n` = newline character.
* `<<` = [append/concatenate](http://rdoc.info/stdlib/core/String#%3C%3C-instance_method).
* The last, lonely `output` returns the full String.
* `puts` prints, but calls `#to_s` on the object before printing out.
* We _redefined_ `#to_s` for our purposes!

!SLIDE bullets
# Side note: Printing and Inspecting

* `puts "hi!"`
    * [Kernel#puts](http://rdoc.info/stdlib/core/Kernel#puts-instance_method)
    * Calls `#to_s` on the object, prints to STDOUT, then adds the `\n`.
* `print "hi!"`
    * [Kernel#print](http://rdoc.info/stdlib/core/Kernel#print-instance_method)
    * Calls `#to_s` on the object and prints to STDOUT.
* ` p "hi!"`
    * [Kernel#p](http://rdoc.info/stdlib/core/Kernel#p-instance_method)
    * Calls `#inspect` on the object, prints to STDOUT.
    * Useful for looking at instance vars/object state.

.pull-right (cont.)

!SLIDE bullets
# Side note: Printing and Inspecting (cont.)

* `pp "hi!"`
    * [Kernel#pp](http://rdoc.info/stdlib/pp/Kernel.pp)
    * "Pretty Print"
    * Must `require "pp"` first.
    * Formats based on the object type, then prints to STDOUT.
* `ap "hi!"`
    * [AwesomePrint#ap](http://rdoc.info/gems/awesome_print/Kernel.ap)
    * Must install `awesome_print` gem first.
    * Event more formatting and coloring based on the object type, then prints
      to STDOUT.

!SLIDE bullets
# Another method

* Let's convert a song to YAML.

    ```ruby
    require 'yaml'

    class Song
      # (old stuff)
      def to_yaml
        the_song = {
          title: @title,
          artist: @artist,
          album: @album,
          track: @track
        }

        YAML.dump(the_song)
      end
    end
    ```

!SLIDE bullets
# Another method (cont.)

* Try it out...

```ruby
> song = Song.new
> puts song.to_yaml
> song.title = 'Happy Birthday'
> puts song.to_yaml
```

!SLIDE bullets
# Another method

* Let's dump the YAML to file.

    ```ruby
    class Song
      # (old stuff)

      def dump(filename=nil)
        filename ||= @title
        filename ||= 'unknown'

        File.write("#{filename}.yml", to_yaml)
      end
    end
    ```

!SLIDE bullets
# Another method (cont.)

* Try it out...

    ```ruby
    > song.dump
    ```
* Check to see if the file got written...
* Now try:

    ```ruby
    > song.dump 'test'
    ```

!SLIDE bullets
# What's going on here? (`#to_yaml`)

* In `#to_yaml`
    * we use a [Hash](http://rdoc.info/stdlib/core/Hash) to determine our
      key/value pairs.
    * `YAML.dump` converts our Hash to a String formatted as YAML.
* On return values...
    * No `return`?
    * All Ruby statements return the last value calculated in them.

!SLIDE bullets
# What's going on here? (`#dump`)
* In `#dump`
    * `||=`...
    * Default parameters!
    * `File.write` writes the String that we get from `#to_yaml` to the
       file name that we either pass in or create.
* On falseyness...
    * `nil` and `false` evaluate to a "falsey" value, when doing logic.
    * `||=`:
        * asks "are you truthy?"
        * if yes, don't do anything...
        * if no, assign the object on the right side of the operator.

!SLIDE
# Method Summary

* Defined some methods for our `Song`.
* Redefined a built-in method to do what we want.

!SLIDE questions title
# Questions?

!SLIDE
# Push to Github

```bash
$ git commit song.rb -m "Added methods"
$ git push origin master
```
