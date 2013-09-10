!SLIDE title
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


!SLIDE bullets
# MusicDB

* We'll build an app that uses some built-in object types, and some of our own.
* Problem to solve:
    * catalog our favorite songs and albums.
* Requirements:
    * Add/retrieve songs.
    * Songs stored in a [YAML](http://www.yaml.org/spec/1.2/spec.html) file.
    * Rate songs 0 - 5.
    * Can add notes about a song.


!SLIDE bullets
# MusicDB: Let's get started

* Start by...
    * Pick a workspace/directory for your code.
    * Create the `music_db` directory.
    * Create & open the file `song.rb` in that directory.
        * (Open with your IDE/editor)


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

* Attributes and abilities are defined as "methods".
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
* Notice, no type checking...


!SLIDE smbullets
# Create A `Song` Object

* IRB time!

    ```ruby
    > require './song'
    > song = Song.new
    > puts song.instance_variable_get(:@title)
    > song.title = 'Going to California'
    > puts song.instance_variable_get(:@title)
    > puts song.title
    > puts song.class
    ```
* Creates an object from the `Song` class.
    * `.new` is the "constructor" method.
    * AKA creates an "instance" of `Song`.
* Assigns it to a "local variable", `song`.
* Reflection!


!SLIDE questions center
# Questions?


!SLIDE smbullets incremental
# OK, so far...

* `class` named `Song`.
* object, `song`, instance of `Song`.
* `song` has an attribute, `title`.
* `title` stored internally to `song` as `@title`.
* Notice Ruby didn't complain about `@title`... Try:

    ```ruby
    puts song.instance_variable_get(:@dog)
    song.instance_variable_set(:@dog, 'Lassie')
    puts song.instance_variable_get(:@dog)
    ```

    * This is breaking the rules!! ...but you can do it with Ruby.
* `nil` is the absence of value.


!SLIDE bullets
# Side note: `nil`, `true`, `false`

* `nil` is the absence of value.
    * ...which is an object!
        * try: `nil.class`
        * try: `nil.to_s`
        * try: `nil.to_a`
        * try: `nil.nil?`
* `true` and `false` are similar.
    * try: `true.class`
    * try: `false.class`
    * try: `true.to_s`
    * try: `false.to_s`

!SLIDE smbullets
# First Class! ...Accessors

* `#title` and `#title=` give access to the object's state...
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
    > load './song.rb'
    > song = Song.new
    > puts song.instance_variable_get(:@title)
    > song.title = 'Going to California'
    > puts song.instance_variable_get(:@title)
    > puts song.title
    ```
* Same behavior as before, but less code!
* `load`?


!SLIDE bullets
# Ruby Philosophy Note #1

* If you do something frequently, look for an easier way--there's a good chance
  Ruby lets you simplify.


!SLIDE bullets
# Side note: `load` vs. `require`

* Both are methods, defined in [Kernel](http://rdoc.info/stdlib/core/Kernel).
* `load`:
    * simply re-reads the code in the given file.
    * requires `.rb` at the end of the file name.
* `require`:
    * searches for that library on the load path.
    * if it's already required, don't do it again.
        * (this is a good thing)


!SLIDE incremental
# Side note: Load Path

* try: `puts $LOAD_PATH`
    * (`$` variables = "global" variables)
* then try: `require "jojo"`
* then try: `require "time"`
* Remember `require "./song"`?
    * `./` tells Ruby to look in the current directory.
* From now on, you use `require` or `load` as you need.


!SLIDE smbullets
# Many Songs?

* A `class` is like the template for an object type.

    ```ruby
    > song1 = Song.new
    > song2 = Song.new
    > puts song1.object_id
    > puts song2.object_id
    ```
* Each `.new` creates a new `Song` object in memory.
* We're assigning those new `Song` objects to variables, but don't have to.

    ```ruby
    > puts Song.new.object_id
    > puts Song.new.object_id
    ```
* Each `Song` object has its own unique ID.
    * (related to its address in memory)


!SLIDE questions center
# Questions?


!SLIDE bullets
# Variable Scope

* What happens if you do this?

    ```ruby
    class Song
      # (existing code above here)
      @artist = 'Led Zeppelin'

      def get_the_artist
        @artist
      end
    end
    ```
* ...and

    ```ruby
    > load './song.rb'
    > song = Song.new
    > song.artist
    > song.get_the_artist
    ```


!SLIDE bullets
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
    > load './song.rb'
    > song = Song.new
    > song.class_artist
    ```


!SLIDE bullets
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
* ...and

    ```ruby
    > require './song'
    > song = Song.new
    > song.class_artist
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


!SLIDE bullets
# Too Much Inception?

* We won't get into this, but...

    ```ruby
    > my_class = Class.new
    > puts my_class.class
    > puts my_class.class.class
    > puts my_class.superclass
    > puts my_class.methods
    > my_object = my_class.new
    > puts my_object
    > puts my_object.class.name
    ```
* Creates a new class without a name!
* Who cares?


!SLIDE bullets
# Ruby Philosophy Note #2

* Treating everything as an object opens tons of possibilities for making
  decisions about the objects in your app at run time.


!SLIDE smbullets
# Side note: On style and syntax

* Class names are capitalized and use `CamelCase`.
* Method names, variable names are lowercase, `snake_case`.
* Instance variables start with a `@`.
* Semi-colons are (usually) optional.
    * `song.title` is the same as `song.title;`
* Parentheses are (usually) optional.
    * `song.title;` is the same as `song.title();`
* Indentation is 2 soft spaces (not hard tabs) (not syntax enforced).
* The keyword `end` finishes multi-line statements.


!SLIDE
# Objects, Classes, Variables Summary

* Objects do your program's work.
    * Carry state.
    * Have attributes and actions as methods.
* Classes are like templates for objects.
* Instance variables hold the internal state of an object.
* Accessor methods give you access to your object's instance variables.
* A class is actually an object of class `Class`.


!SLIDE questions center
# Questions?


!SLIDE bullets
# Before we move on...

* Let's just add some other attributes...

    ```ruby
    class Song
      attr_accessor :title, :artist, :album, :track, :notes
    end
    ```


!SLIDE bullets
# Commit to Github

1. Create the `music_db` repo [via Github](https://help.github.com/articles/create-a-repo).
+ From the command line, inside your `music_db` directory:

    ```bash
    $ git init
    $ git add song.rb
    $ git commit -m "First bits!"
    $ git add remote origin https://github.com/_username_/music_db
    $ git push -u origin master
    ```
+ Refresh/check your Github page.
