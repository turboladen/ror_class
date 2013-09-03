!SLIDE center just-title
# Sharing Functionality
## Inheritance, Modules, Mix-ins


!SLIDE
# What's this all about?

* Removing code duplication!
* Classes let us define and reuse an object type.
* What if you have some similar object types?
* Let's look at an Artist...
    * How are a song and artist similar?
    * ...let's write some code...

!SLIDE bullets
# `Artist`

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

* Our `YAML` methods are similar... let's [refactor](http://refactoring.com)!


!SLIDE
# Inheritance

* A common OOP construct.
* A "refinement or specialization of another class."
* Let's talk shapes.  A abstract shape has:
    * area
    * dimensions
* Some shapes have sides, some don't.
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
    * `Triangle` is the "subclass" of `Polygon`.
    * `Polygon` is the "subclass" of `Shape`.
    * `Triangle`'s "parent class" is `Polygon`.
    * `Polygon`'s "parent class" is `Shape`.
* If not given, Ruby classes inherit from `Object`.

!SLIDE smbullets
# Shapes (cont.)

Also notice we're...

* Using `attr_reader` from `Polygon` to get the value of `@sides` in `Triangle`.
* Redefining `#area` and `#dimensions` in `Triangle`.

!SLIDE questions title

# Questions?
