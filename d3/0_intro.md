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
# [Day 3/12](d3): Language LessBasics

* Stuff we missed from last session
* Testing with RSpec
* Regular Expressions
* Exceptions
* Input/Output
* Duck Typing
* Metaprogramming
* Documenting your code
* RubyGems & Bundler


!SLIDE bullets
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
    * Don't do more than 5.


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

!SLIDE questions title

# `> puts 'questions?'`
