!SLIDE center
# But there's another way to share...


!SLIDE smbullets
# Composition with Modules

* Composition: use `module`s to mix methods into other objects.
* Kind of like polymorphism, but not.
* `module`s are...
    * Similar to `class`es, but do less.
        * (`Class` actually inherits from `Module`).
    * Used like containers for grouping methods, classes, constants.
    * Provide a namespace for preventing name clashes.
    * Can be mixed in to other classes, modules, or objects.


!SLIDE
# Shape Redo?

```ruby
module Shape
  attr_reader :area, :dimensions
end
module Polygon
  attr_reader :sides
end
class Triangle
  include Shape
  include Polygon

  def initialize(base, height)
    @sides = 3
    @base, @height = base, height
  end

  def area
    @base * @height * 0.5
  end

  def dimensions
    [@base, @height]
  end
end
```


!SLIDE bullets
# Shapes as Modules

* Illustrates use, but not really a good one.
* Let's get back to music_db and refactoring `Artist`.


!SLIDE bullets
# `Artist`, again

* Remember...

    ```ruby
    class Artist
      attr_accessor :name

      def initialize(name)
        @name = name
      end

      def to_yaml
        YAML.dump(name: @name)
      end

      def dump(filename=nil)
        filename ||= @name ||= 'unknown_artist'
        File.write("#{filename}.yml", to_yaml)
      end
    end
    ```
* `#to_yaml` and `#dump` are similar to those in `Song`.


!SLIDE bullets
# YAMLable

* When used as mix-ins, `module`s tend to be adjectives.
* Create `music_db/yamlable.rb`:

    ```ruby
    require 'yaml'

    module YAMLable
      def to_yaml
        YAML.dump(attributes)
      end

      def dump(filename=nil)
        filename ||= 'unknown'

        File.write("#{filename}.yml", to_yaml)
      end
    end
    ```
* Now we can make lots of things YAMLable!


!SLIDE bullets
# `Artist`, `YAMLable`ized

* Redo `Artist`:

    ```ruby
    require_relative 'yamlable'

    class Artist
      include YAMLable

      attr_accessor :name

      def initialize(name)
        @name = name
      end

      def attributes
        { name: @name }
      end
    end
    ```

    ```ruby
    > artist = Artist.new('Wynton Marsalis')
    > puts artist.to_yaml
    > puts artist.dump('wynton')
    ```


!SLIDE bullets
# `Song`, `YAMLable`ized

* Redo `Song`:
    * Click [here](https://github.com/turboladen/ror_class/blob/78fde36822cc47d9d565d09e536c2ba3f8b03613/music_db/song.rb).
      (too big to fit on a slide)

    ```ruby
    > song = Song.new('Linus & Lucy', 'Wynton Marsalis')
    > puts song.to_yaml
    > puts song.dump('linus and lucy')
    ```


!SLIDE
# Composition Recap

* Define functionality in a `module`.
* `include` the module into the `class`es that should have that functionality.

!SLIDE questions center

# Questions?

