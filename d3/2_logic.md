!SLIDE title
# Logic and Control Flow


!SLIDE smbullets
# `if`, `else`, and `elsif`

* Ruby uses these for checking conditions and changing code execution paths.
* Let's update `YAMLable`:

    ```ruby
    def to_yaml
      if self.respond_to? :attributes
        YAML.dump(attributes)
      else
        raise "Hey, #{self.class} needs some attributes!"
      end
    end
    ```
* Notice: when true, returns result of `YAML.dump`.
* Use `elsif` if more than one condition to check.


!SLIDE bullets
# `Album` without attributes

* Create `lib/music_db/album.rb`:

    ```ruby
    require_relative 'yamlable'

    class MusicDB::Album
      include YAMLable

      attr_accessor :title, :artist, :year
    end
    ```
* Update `lib/music_db.rb` with:

    ```ruby
    require_relative 'music_db/album'
    ```
* Try it...

    ```ruby
    > album = MusicDB::Album.new
    > album.to_yaml         # raises!
    ```


!SLIDE bullets
# Others...

* Ternary:

    ```ruby
    puts 0.zero? ? 'yes!' : 'no.'       # => 'yes!'
    ```
* `case`/`when`/`else`:

    ```ruby
    print "Enter your grade: "
    grade = gets.chomp

    phrase = case grade
    when "A"
      'Well done!'
    when "B"
      'Almost!'
    else
      'Busted!'
    end

    puts phrase
    ```


!SLIDE bullets
# Others... (cont.)

* Last example, rewritten using `case` with `then`s:

    ```ruby
    print "Enter your grade: "
    grade = gets.chomp

    phrase = case grade
    when "A" then 'Well done!'
    when "B" then 'Almost!'
    else 'Busted!'
    end

    puts phrase
    ```
* `unless` is like `if not`:

    ```ruby
    today = Time.now

    unless today.saturday? || today.sunday?
      puts "Go to work"
    end
    ```


!SLIDE bullets
# `if` and `unless` Modifiers

* A "modifier" modifies a statement; comes at the end of the statement.

    ```ruby
    class Time
      def weekend?
        saturday? || sunday?
      end
    end

    today = Time.now
    puts "Sleep in!" if today.weekend?
    puts "Go to work" unless today.weekend?
    ```
* Good practice: only use modifiers with 1-liners.


!SLIDE bullets
# Loops

* At least 4 standard built-in loop types:
    * `while`
    * `until`
    * `loop`
    * `for`...

    ```ruby
    pant_legs = 0

    while pant_legs < 2
      puts pant_legs += 1
    end

    # ...or...
    pant_legs = 0

    until pant_legs == 2
      puts pant_legs += 1
    end
    ```


!SLIDE bullets
# Loops (cont.)

```ruby
pant_legs = -1

loop do
  if pant_legs < 0
    pant_legs += 1
    next
  end

  break if pant_legs == 2
  puts pant_legs += 1
end
```

* `next` and `break` aren't just for `loop`.


!SLIDE bullets
# `while` and `until` modifiers

* Similar to `if` and `unless`.
* Do one-liner loops...

    ```ruby
    pant_legs = 0
    puts pant_legs += 1 while pant_legs < 2

    # ...or...

    pant_legs = 0
    puts pant_legs += 1 until pant_legs == 2

    ```


!SLIDE
# Control Flow Summary

* Lots of ways to slice and dice logic.
    * ...more than we talked about.
* Look for most readable way to write your statement.
* Modifiers are cool.


!SLIDE questions center

# Questions?
