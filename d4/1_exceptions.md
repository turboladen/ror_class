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

!SLIDE
# So why exceptions?

*


!SLIDE bullets
# Raising in Ruby

* `raise` or `fail`.
    * Same thing, but you'll usually see `raise`.
    * Both are methods, defined in [Kernel](http://rdoc.info/stdlib/core/Kernel).
        * (remember methods can be redefined in Ruby...)

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

* Handle them by wrapping them in a `begin; rescue; end` block.

    ```ruby
    begin
      File.open('blargh', 'r')
    rescue Errno::ENOENT => ex
      puts "'blargh' doesn't exist!"
      puts ex.message
      raise
    end
    ```
* Rescue a specific class of exception, or a comma-separated list.
* The `raise` just re-raises the same exception.
    * Without it, execution just continues on.

!SLIDE bullets
# Handling Exceptions (cont.)

* Can also...

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

!SLIDE section-header
# Ok, that's enough.

!SLIDE questions center
# Questions?
