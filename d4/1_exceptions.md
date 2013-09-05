!SLIDE title
# Exceptions

!SLIDE bullets transition=turnUp
# Some Definitions

* Exception:
    * the occurrence of an abnormal condition during the execution of a software element.
* Failure:
    * the inability of a software element to satisfy its purpose.
* Error:
    * the presence in the software of some element not satisfying its specification.
* "Failures cause exceptions, and are generally caused by errors."

Source: Avdi Grim's [_Exceptional Ruby_](http://exceptionalruby.com)

!SLIDE bullets incremental
# So why exceptions?

* Errors will occur!
* When creating code that someone will consume...
    * communicate to them that something abnormal occurred.
    * Done in Ruby via `raise`ing exceptions.
* When using someone's reusable code...
    * you decide what to do when something abnormal occurs.
    * Done in Ruby via `rescue`ing exceptions.


!SLIDE bullets
# Raising in Ruby

* `raise` or `fail`.
    * Same thing, but you'll usually see `raise`.
    * Both are methods, defined in [Kernel](http://rdoc.info/stdlib/core/Kernel).
        * (remember methods can be redefined/hooked into in Ruby...)

    ```ruby
    module AnimalWords
      def meow
        raise if self.is_a? Dog
        puts 'Meow.'
      end
    end

    class Dog; include AnimalWords; end
    Dog.new.meow        # RuntimeError!
    ```
* Raises a `RuntimeError` with no message.

!SLIDE bullets
# Raising in Ruby (cont.)

* Let's do better...

    ```ruby
    module AnimalWords
      def meow
        raise "I can't meow!" if self.is_a? Dog
        puts 'Meow.'
      end
    end

    class Dog; include AnimalWords; end
    Dog.new.meow        # RuntimeError!
    ```
* Raises a `RuntimeError`, but with a message.

!SLIDE bullets
# Raising in Ruby (cont.)

* Let's use our own type of exception...
    * `RuntimeError` is a subclass to [Exception](http://rdoc.info/stdlib/core/Exception).

    ```ruby
    class AnimalMismatch < RuntimeError; end

    module AnimalWords
      def meow
        if self.is_a? Dog
          raise AnimalMismatch, "I can't meow!"
        end

        puts 'Meow.'
      end
    end

    class Dog; include AnimalWords; end
    Dog.new.meow        # AnimalMismatch!
    ```
* Raises a `AnimalMismatch` with a message.

!SLIDE bullets
# Handling Exceptions

* Handle them by wrapping them in a `begin; rescue; end`.

    ```ruby
    begin
      File.open('blargh.txt', 'r')
    rescue Errno::ENOENT => ex
      puts "'blargh.txt' doesn't exist!"
      puts ex.message
      raise
    end
    ```
* Rescue a specific class of exception, or a comma-separated list.
* The `raise` just re-raises the same exception.
    * Without it, execution just continues on.
* _If not rescued, the exception with cause code execution to halt._

!SLIDE bullets
# Handling Exceptions (cont.)

* Similarly...

    ```ruby
    begin
      File.open('blargh', 'r')
    rescue => ex
      File.write('blargh', 'BLAAARRRGGGHHH')
      retry
    ensure
      File.delete('blargh') if File.exists?('blargh')
    end
    ```
* No class to rescue implies rescue of `StandardError`.
    * `Errno::ENOENT` is a child to `StandardError` though...
* `retry` adds control flow, but don't abuse this!
* `ensure` is executed, raise or not.

!SLIDE
# Ok, that's enough. Summary plz.

* Exceptions are classes.
* `Kernel#raise` will halt code execution unless handled.
* `Kernel#rescue` lets you deal with the exception in a way that makes sense for
  your code.
    * Careful!  Lets you "swallow" exceptions, which can lead to problems.
        * Often times, letting your app die is best.

!SLIDE questions center
# Questions?
