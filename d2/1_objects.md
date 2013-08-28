!SLIDE center just-title
# Objects, Classes, Variables

!SLIDE bullets incremental
# Object-Orientedness & Ruby

* Remember?
    * Focus of programming is on nouns--the objects--and their attributes and
      abilities.
* Ruby's core = _everything is an object_.
* To build your software "thing", you:
    * Use different kinds of objects that Ruby defines for you.
    * Define your own type of objects.
    * Put them together to make the computer do what you want.
* Remember the car?

!SLIDE
# MusicDB

* We'll build an app that uses some built-in object types, and some of our own.
* Start by...
    * Pick a workspace/directory for your code.
    * Create the `music_db` directory.
    * Create & open the file `song.rb` in that directory.

!SLIDE bullets
# First Class!

* Type this in the `song.rb` file and save it:

```ruby
class Song
  def title
    @title
  end

  def title=(new_title)
    @title = new_title
  end
end
```

.pull-right (cont.)

!SLIDE bullets
# First Class! (cont.)

* Object types are defined as `class`es.

```ruby
class Song
  def title
    @title
  end

  def title=(new_title)
    @title = new_title
  end
end
```

* `Song` is the type of object.


!SLIDE smbullets
# First Class! ...Methods

* Attributes and abilities are defined as "method"s.
* Methods are defined using the `def` "keyword".

```ruby
class Song
  def title
    @title
  end

  def title=(new_title)
    @title = new_title
  end
end
```

* `#title` is an attribute of the `Song` class.
* `#title=` a method that lets you set that attribute.


!SLIDE smbullets
# First Class! ...Instance Variables

* State of an object is stored in "instance variables".
* Instance variables are designated by `@` + `[variable name]`.

```ruby
class Song
  def title
    @title
  end

  def title=(new_title)
    @title = new_title
  end
end
```

* `@title` is an instance variable for any object that's derived from the `Song`
  `class`.


!SLIDE bullets incremental
# WAT?

* _Instance what??_
* A variable is just a container for an object.

```ruby
  def title=(new_title)
    @title = new_title
  end
```

* `@title` will contain the `new_title` object if you call `#title=`.
* This "assigns" the object contained in `new_title` to `@title`.

!SLIDE smbullets
# Create A `Song` Object

* IRB time!

```ruby
$ irb
001:0> require './song'
002:0> song = Song.new
003:0> puts song.instance_variable_get(:@title)
004:0> song.title = 'Going to California'
005:0> puts song.instance_variable_get(:@title)
006:0> puts song.title
007:0> puts song.class
```

* Creates an object from the `Song` class.
    * `.new` is the "constructor" method.
    * AKA creates an "instance" of `Song`.
* Assigns it to a "local variable", `song`.
* Reflection!


!SLIDE questions title commandline incremental

```
$ puts "questions?"
```

!SLIDE smbullets
# OK, so far...

* `class` named `Song`.
* object, `song`, instance of `Song`.
* `song` has an attribute, `title`.
* `title` stored internally to `song` as `@title`.


!SLIDE smbullets
# First Class! ...Accessors

* `title` and `title=` give access to the object's state...
* (object's state stored in instance variables)

```ruby
class Song
  def title
    @title
  end

  def title=(new_title)
    @title = new_title
  end
end
```

* ...thus, called "accessor" methods.

.pull-right (cont.)


!SLIDE smbullets
# First Class! ...Accessors (cont.)

* "Getters and setters" are so common, Ruby makes it easier...
* Change your code to look like:

```ruby
class Song
  attr_accessor :title
end
```

* `attr_accessor` provides getter and setter.
* `attr_reader` provides getter.
* `attr_writer` provides setter.

!SLIDE
# Let's try that again...

* IRB time!

```ruby
$ irb
001:0> require './song'
002:0> song = Song.new
003:0> puts song.instance_variable_get(:@title)
004:0> song.title = 'Going to California'
005:0> puts song.instance_variable_get(:@title)
006:0> puts song.title
```

* Same behavior as before, but less code!

!SLIDE
# Ruby Philosophy Note #1

* If you do something frequently, look for an easier way--there's a good chance
  Ruby lets you simplify.

!SLIDE
# Many Songs?

* A `class` is like the template for an object type.

```ruby
$ irb
001:0> require './song'
002:0> song1 = Song.new
003:0> song2 = Song.new
004:0> puts song1.object_id
005:0> puts song2.object_id
```

* Each `.new` creates a new `Song` object in memory.
* Each `Song` object has its own unique ID.


!SLIDE questions title commandline incremental

```
$ puts "questions?"
```

!SLIDE
# Variable Scope

* What happens if you do this?

```ruby
class Song
  @artist = 'Led Zeppelin'

  def get_the_artist
    @artist
  end
end
```

...and

```ruby
001:0> require './song'
002:0> song = Song.new
003:0> song.artist
004:0> song.get_the_artist
```

!SLIDE
# Variable Scope (cont.)

* Now what about this?

```ruby
class Song
  @artist = 'The Pogues'

  def artist; 'Led Zeppelin'; end
  def get_the_artist; @artist; end

  def class_artist
    self.class.artist
  end
end
```

...and

```ruby
001:0> require './song'
002:0> song = Song.new
003:0> song.class_artist
```

!SLIDE
# Variable Scope (cont.)

* Now what about _this_?

```ruby
class Song
  @artist = 'The Pogues'

  def artist; 'Led Zeppelin'; end
  def get_the_artist; @artist; end

  def class_artist
    self.class.instance_variable_get(:@artist)
  end
end
```

...and

```ruby
001:0> require './song'
002:0> song = Song.new
003:0> song.class_artist
```

!SLIDE incremental smbullets
# OK, what's going on here?

* With `#title`, we had `@title` in a method...
* Here, we've got 2 _different_ `@artist` variables--can you spot them?
* How are they different?
* In `#get_the_artist`, `@artist` holds state of _instances_ of `Song`.
    * `#get_the_artist` is technically an "instance method".
* Remember "everything is an object?"
* The other `@artist` is defined `Song`'s scope...
    * is instance variable of the `Song` object!
* The `class` `Song` is an object of class `Class`.

!SLIDE
# Too Much Inception?

* We won't get into this, but...

```ruby
$ irb
001:0> my_thing = Class.new
002:0> puts my_thing.class
003:0> puts my_thing.class.class
004:0> puts my_thing.superclass
005:0> puts my_thing.methods
```

!SLIDE
# Ruby Philosophy Note #2

* Treating everything as an object opens tons of possibilities for making
  decisions about the objects in your app at run time.


!SLIDE questions title commandline incremental

```
$ puts "questions?"
```

!SLIDE bullets
# Add `Song` Attributes

* Let's just add some other attributes...

```ruby
class Song
  attr_accessor :title, :artist, :album, :track
end
```

!SLIDE
# Summary on style and syntax...

* Class names are capitalized and use `CamelCase`.
* Method names, variable names are lowercase, `snake_case`.
* Instance variables start with a `@`.
* Semi-colons are (usually) optional.
    * `song.title` is the same as `song.title;`
* Parentheses are (usually) optional.
    * `song.title`; is the same as `song.title();`
* Indentation is 2 soft spaces (not hard tabs) (not syntax enforced).
* The keyword `end` finishes multi-line statements.

!SLIDE
# Objects, Classes, Variables Summary

* Objects do your program's work.
    * Carry state.
    * Have attributes and actions as methods.
* Classes are like templates for objects.
* A class is actually an object of class `Class`.
* Instance variables hold the internal state of an object.
