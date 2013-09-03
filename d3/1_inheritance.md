!SLIDE center just-title
# Sharing Functionality
## Inheritance and Composition


!SLIDE
# What's this all about?

* Removing code duplication!
* Classes let us define and reuse an object type.
* What if you have some similar object types?
* Let's look at an Artist...
    * How are a song and artist similar?
    * ...let's write some code...

!SLIDE bullets
* Create `Artist` in `artist.rb`:

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
        filename ||= 'unknown_artist'

        File.write("#{filename}.yml", to_yaml)
      end
    end
    ```
* Our `YAML` methods are similar... let's [refactor](http://refactoring.com)!
* ...but first...


!SLIDE
# Inheritance

* A common OOP construct.
* A "refinement or specialization of another class."

----

* Let's talk shapes.  An abstract shape has:
    * area
    * dimensions
* Polygons are shapes that have sides.
    * triangle has 3...
    * rectangle has 4...


!SLIDE
# Shapes

```ruby
class Shape
  attr_reader :area, :dimensions
end

class Polygon < Shape
  attr_reader :sides
end

class Triangle < Polygon
  def initialize(base, height)
    @sides = 3
    @base = base
    @height = height
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
# Shapes (cont.)

```ruby
> t = Triangle.new(3, 4)
> puts t.sides                  # => 3
> puts t.area                   # => 6.0
> puts t.class.ancestors        # => [Triangle, Polygon, Shape, Object, Kernel, BasicObject]
> puts Triangle.superclass      # => Polygon
> puts Polygon.superclass       # => Shape
> puts Shape.superclass         # => Object
> puts Object.superclass        # => BasicObject
> puts BasicObject.superclass   # => nil
```

* Relationships...
    * `Triangle` is the "subclass of" and "inherits from" `Polygon`.
    * `Polygon` is the "subclass of" and "inherits from" `Shape`.
    * `Triangle`'s "parent class" is `Polygon`.
    * `Polygon`'s "parent class" is `Shape`.
* If not given, Ruby classes inherit from `Object`.

!SLIDE smbullets
# Shapes (cont.)

Also notice...

* Using `attr_reader` from `Polygon` to get the value of `@sides` in `Triangle`.
* Redefining `#area` and `#dimensions` in `Triangle`.
* `BasicObject` is the root class for everything.
* `Kernel` is a `module` that gets mixed in to `Object`.
    * (We'll talk about `module`s in a sec)

!SLIDE questions title

# Questions?
