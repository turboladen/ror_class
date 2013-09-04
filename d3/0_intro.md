!SLIDE center just-title
# Geekwise: Ruby on Rails

## Day 3/12: Language LessBasics


!SLIDE questions center

```ruby
questions.any? { |q| q.created_at > Time.yesterday }
```

### (any questions since last time?)

!SLIDE
# Today's Goals

1. Learn more of Ruby's philosophy.
+ Learn more of Ruby's language basics.

!SLIDE
# Language LessBasics Overview

* Stuff we missed from last session
* Sharing Functionality: Inheritance and Composition
* Logic and Control Flow
* Containers, Blocks, Iterators
* Documenting your code
* RubyGems & Bundler

!SLIDE bullets
# Changes!

* I removed:
    * Regular Expressions
    * Input/Output
    * Duck Typing
    * Metaprogramming
* I moved:
    * Testing with RSpec
    * Exceptions


!SLIDE
# Stuff we missed from last session

* [STDLIB](d2#56)
* `def initialize; end`


!SLIDE bullets
# `song.rb` Revisit

* Your `song.rb` should look something like this one...
    * [song.rb](https://github.com/turboladen/ror_class/blob/2366247915e440a664b7ec0280b0057381e482ec/music_db/song.rb)

!SLIDE bullets
# Object Constructor: `#initialize`

* Lets you construct your object with some default state:

    ```ruby
    class Song
      def initialize(title, artist, album=nil, track=nil)
        @title = title
        @artist = artist
        @album = album
        @track = track
      end

      # (your existing code...)
    end
    ```
* No limit on number of params...
    * Good practice: don't do more than 5.


!SLIDE bullets
# `#initialize` (cont.)

* Let's try...

    ```ruby
    > s = Song.new
    ```
* Error!  ...now let's try it...

    ```ruby
    > s = Song.new('Blackbird', 'The Beatles')
    > puts s.title
    > puts s.artist
    > s = Song.new('Common People', 'Pulp', 'Hits')
    > puts s.album
    > puts s.track
    ```

!SLIDE bullets
# Different inits/method params

* "Splat":
    * Variable number of params as an Array.

    ```ruby
    class Song
      def initialize(*options)
        # options.class     # => Array
        @title = options[0]
        @artist = options[1]
        @album = options[2]
        @track = options[3]
      end
      # (your existing code...)
    end
    ```
* Good for if you don't want to make user pass a certain set of params.
* Can make it less clear to user what the method expects.

!SLIDE bullets
# Different inits/method params (cont.)

* "Double-splat":
    * Variable number of params as a Hash.

    ```ruby
    class Song
      def initialize(**options)
        # options.class     # => Hash
        @title = options[:title]
        @artist = options[:artist]
        @album = options[:album]
        @track = options[:track]
      end
      # (your existing code...)
    end
    ```
* Let's the user be a little more explicit when calling.
* Don't get carried away with this; can be [code smell](http://en.wikipedia.org/wiki/Code_smell).

!SLIDE bullets
# Different inits/method params (cont.)

* To use...

    ```ruby
    > s = Song.new
    > puts s.album          # => nil
    > puts s.track          # => nil
    > s = Song.new(artist: 'Pulp', album: 'Hits', title: 'Common People')
    > puts s.album          # => 'Hits'
    > puts s.track          # => nil
    ```

!SLIDE bullets
# Different inits/method params (cont.)

* Named parameters:
    * Similar to double-splat, but more explicit and less work.

    ```ruby
    class Song
      def initialize(title: title, artist: artist, album: nil, track: nil)
        @title = title
        @artist = artist
        @album = album
        @track = track
      end

      # (your existing code...)
    end
    ```
* `nil` values as params won't raise an error.
* non-`nil` values will raise error.

!SLIDE bullets
# Different inits/method params (cont.)

* Use it like...

    ```ruby
    > s = Song.new(artist: 'Pulp', album: 'Hits', title: 'Common People')
    > puts s.album
    > puts s.track
    ```

!SLIDE bullets
# Different inits/method params (cont.)

* Mix it up...

    ```ruby
    class Song
      def initialize(title, *opts, album: nil, track: nil)
        @title = title
        @artist = opts[0]
        @album = album
        @track = track
      end

      # (your existing code...)
    end
    ```
* Param types must be in this order:
    * regular
    * splat
    * double-splat/named


!SLIDE
# `#initialize` Summary

* Defines params to pass in when calling `.new` on your class.
* Sets up state of the object.
* Lots of ways to pass in params.
    * (those ways apply for any method, not just `#initialize`)

!SLIDE questions title

# Questions?
