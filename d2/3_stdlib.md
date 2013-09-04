!SLIDE center just-title
# STDLIB

!SLIDE
# What is it?

* "Standard Library".
* Common helper libraries that Ruby thinks you can use regularly.
* Exists to help you do lots of things.

!SLIDE smbullets
# Homework!

* Check out the documentation and experiment.
    * What can you do to `Song`?
* http://rdoc.info/stdlib
* Interesting libraries:
    * benchmark
    * drb
    * erb
    * json
    * open-uri
    * net
    * time


!SLIDE smbullets
# Some Interesting String Methods

* `#to_sym` converts to a Symbol:

    ```ruby
    "one".to_sym        # => :one
    ```
* `#to_i` converts to a Number:

    ```ruby
    "1".to_i            # => 1
    ```
* `#gsub(pattern, replacement)` replaces all patterns with replacement:

    ```ruby
    "I like cats, cat".gsub(/cat/, 'dawg')      # => "I like dawgs, dawg"
    ```
* `#each_line` splits on `\n`, and gives you each line:

    ```ruby
    "stuff\nthings".each_line { |line| puts "My #{line}" }
    ```

!SLIDE bullets
# Symbols

* Symbols are sort of like immutable strings.
* Useful as labels, Hash keys.

    ```ruby
    > :thing.class          # => Symbol
    > :thing.to_s           # => "thing"
    > my_book = { :title => "Programming Ruby" }
    > my_book[:title]       # => "Programming Ruby"
    ```
* When using with Hashes, shortcut:

    ```ruby
    > my_book = { title: "Programming Ruby" }
    > my_book[:title]
    ```
* Use as messages to send to objects:

    ```ruby
    > 12345.send(:to_s)
    ```

!SLIDE bullets
# Arrays & Hashes

* Each can contain any type of object:

    ```ruby
    array = [nil, 1, "two", Object]
    hash = { 1 => 'one', 'two' => 2, Object.new =>
      lambda { |x| x + 1 }, nil => nil }
    ```
* Arrays are 0-indexed:

    ```ruby
    array[0]        # => nil
    array[1]        # => 1
    ```

* Hashes are made up of keys & values:

    ```ruby
    hash.keys       # => [1, "two", #<Object:0x00...>, nil]
    hash.values     # => ["one", 2, #<Proc:0x007...>, nil]
    hash[1]         # => "one"
    hash['two']     # => 2
    hash[:nada]     # => nil
    ```

!SLIDE bullets
# Arrays & Hashes (cont.)

* Some useful methods:

    ```ruby
    numbers = [1, 2, 3]
    numbers.first                       # => 1
    numbers.map { |x| x * 10 }          # => [10, 20, 30]
    numbers.empty?                      # => false
    numbers.include? 3                  # => true
    numbers.find_all { |x| x > 2 }      # => [3]
    numbers.any? { |x| x > 2 }          # => true
    %w[one two three]                   # => ['one', 'two', 'three']
    %i[one two three]                   # => [:one, :two, :three]
    ```

!SLIDE bullets
# Arrays & Hashes & Params

* Arrays and the "splat" = variable param count:

    ```ruby
    def things(*all_the_things)
      puts "#{all_the_things.class}, size #{all_the_things.size}"
    end

    things                      # => "Array, size 0"
    things('cat', 'dog')        # => "Array, size 2"
    ```
* Hash and the "double-splat":

    ```ruby
    def things(**named_things)
      puts "#{named_things.class}, size #{named_things.size}"
    end

    things name1: 'cat'                     # => "Hash, size 1"
    things(name1: 'cat', name2: 'dog')      # => "Hash, size 2"
    ```

!SLIDE bullets
# Named Parameters for Methods

* Ruby 2.0 added named parameters:

    ```ruby
    def jump(height: 10, wear_pants: false, **options)
      message = "Jumping #{height} inches"
      message << " WITH NO PANTS!" unless wear_pants
      options.each { |key, value| message << " --#{key}=#{value}" }
      puts message
    end

    jump                                # => "Jumping 10 inches WITH NO PANTS!"
    jump(wear_pants: true)              # => "Jumping 10 inches"
    jump(say: 'RAWR')                   # => "Jumping 10 inches WITH NO PANTS! --say=RAWR"
    jump(wear_pants: true, height: -1, barrel_roll: true)   # => "Jumping -1 inches --barrel_roll=true"
    ```

!SLIDE questions title
# Questions?

!SLIDE
# Wrap Up

* Covered
    * Classes, Objects, Variables
    * Methods
    * STDLIB and some Core objects
* We didn't cover...?
