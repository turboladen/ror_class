!SLIDE center just-title
# Containers, Blocks, and Iterators

!SLIDE bullets
# Iterators

* Iterators are:
    * like loops but more powerful.
    * far more commonly used that loops in Ruby.
* Use "blocks" to allow you to act on the object from the collection of objects
  you're iterating over.
* You'll find many in the [Enumerable](http://rdoc.info/stdlib/core/Enumerable)
  module.
    * `Enumerable` is mixed into many STDLIB classes:
        * `Array`
        * `Hash`
        * `Range`
        * etc


!SLIDE bullets
# Blocks

* Blocks are:
    * similar to Procs, lambdas, JS functions, closures.
    * chunks of code that can be passed around.
    * like a method, but carry the context they were defined in.
* Blocks allow for iterators.
* You don't have to understand how they work to start using iterators.

!SLIDE bullets
# Blocks in the wild

* Example: `Range#find`:

    ```ruby
    (1..100).find { |i| i % 5 == 0 and i % 7 == 0 }     # => 35
    ```
* Example: `Array#each`:

    ```ruby
    hobbies = ['read', 'write', 'arithmetic']
    hobbies.each do |hobby|
      puts "I like to do the #{hobby}s."
    end

    # => "I like to do the reads."
    # => "I like to do the writes."
    # => "I like to do the arithmetics."
    ```

!SLIDE bullets
# _Take one down, pass it around..._

* Blocks by themselves are reusable chunks of code...
* Could be like:

    ```ruby
    the_finder = lambda { |i| i % 5 == 0 and i % 7 == 0 }
    # => #<Proc:0x007fde1a83c90d@(irb):39 (lambda)>
    (1..100).find(&the_finder)
    # => 35
    (36..100).find(&the_finder)
    # => 70
    (1..100).find_all(&the_finder)
    # => [35, 70]
    ```

!SLIDE bullets
# How it doez that?

* Let's pretend with `Array`...

    ```ruby
    class Array
      def each(&my_neat_block)
        0.upto(self.length - 1) do |index|
          current_element = self[index]
          #yield(current_element) if block_given?
          my_neat_block.call(current_element)
        end
      end

      def find
        self.each do |item|
          result = yield(item)
          return(item) if result
        end
      end
    end
    ```

!SLIDE bullets incremental
# How it doez that? (cont.)

* `yield` or `call` hands control over to the block that was given.
    * If a value(s) is passed to `yield`, it's handed over as the block
      parameter(s).
    * The return value of the block is returned from `yield`, back in the method.
* Note:
    * `find` doesn't show that it takes a param...
        * Tricky Ruby: any method can take a block without saying so!
    * `#block_given?` checks if the caller passed a block in.
        * Allows you to define method for both code paths.
    * `#call` to call the block; `#yield` if no explicit block.
        * Same effect.
    * `return` (in `#find`) stops iterating and returns the value.

!SLIDE smbullets incremental
# Creating Blocks

* Create blocks using:
    * `Proc.new`
    * `#lambda`
    * `#proc`
* `Proc.new` doesn't arity check block params.
* `#proc`
    * is an alias for `Proc.new`.
    * is actually `Kernel#proc`.
* `#lambda`
    * arity checks block params.
    * is actually `Kernel#lambda`.

!SLIDE
# Block Summary

* Don't worry if this doesn't click at first.
* Use iterators and it'll eventually make sense.
    * You'll want to get familiar with `#each`...

    ```ruby
    [1, 2, 3].each do |number|
      puts number
    end
    ```

!SLIDE questions center
# Questions?
