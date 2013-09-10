!SLIDE title
# Documentation


!SLIDE
# Why?

* So your Ruby friends can see how to use your Ruby things.
* So you understand what you're making you/others use.
* You'll catch bugs.


!SLIDE bullets
# Many Tools

* https://www.ruby-toolbox.com/categories/documentation_tools
    * RDoc
    * Yard
    * DocumentUp
    * Rocco
    * Ronn
* RDoc and Yard are most prevalent.


!SLIDE bullets
# Yard

* Yard recognizes RDoc formatting, as well as others.
* Yard allow for far more explicitness.
    * `param` and `return` makes those things clear.
    * http://rubydoc.info/gems/yard/file/docs/Tags.md

    ```ruby
    # This is an automobile that you can drive and go places.
    class Car

      # @param [String] color The color of the car.
      def initialize(color)
      end

      # @return [Boolean] +true+ if successful; +false+ if not.
      def go_forward
      end
    end
    ```


!SLIDE
# Homework!

* Read up on Yard at http://yardoc.org.
* Document MusicDB and push to Github.
* Examples:
    * https://github.com/turboladen/tailor/tree/master/lib/tailor
