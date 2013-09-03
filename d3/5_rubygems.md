!SLIDE center just-title
# RubyGems

!SLIDE bullets
# Intro

* [RubyGems Guides](http://guides.rubygems.org)
* What is a gem?
    * A compressed archive (like tgz, zip) with your project files.
    * "Spec" or .gemspec file defines its metadata.
    * Doesn't have to be Ruby code!
* Why?
    * Easy to distribute & version libraries.
    * Provides conventions for code organization, etc.
    * Manages `$LOAD_PATH`.
    * Demo!


!SLIDE bullets
# Versioning!

* Encourages conventional [versioning](http://docs.rubygems.org/read/chapter/7).
    * 3 categories of code change types:
        * Implementation detail only.
        * Add new features, but all is compatible with previous versions.
        * Public interface changes, making previous versions incompatible.
    * ...thus 3 levels of version: x.y.z.
    * Version comparing becomes easy and predictable.
        * `>`, `>=`, `<`, `<=`
        * `~>`

!SLIDE bullets
# Structure!

* All gems follow the same standard structure of code organization:

```
% tree music_db
music_db/
├── bin/
│   └── music_db
├── lib/
│   └── music_db.rb
├── test/
│   └── test_music_db.rb
├── README
├── Rakefile
└── music_db.gemspec
```

!SLIDE smbullets
# Structure! (cont.)

* `bin/music_db` should use functionality that's defined in `lib/*`.
* `lib/music_db.rb` implies

    ```ruby
    module MusicDB
    ```
* `lib/music_db/song.rb` implies

    ```ruby
    module MusicDB::Song
    ```
* `test/test_music_db.rb` contains tests for

    ```ruby
    module MusicDB
    ```
* test/music_db/test_song.rb contains tests for

    ```ruby
    class MusicDB::Song
    ```

!SLIDE bullets
# Homework

* Use [RubyGems guides](http://guides.rubygems.org) to gemify MusicDB.
    * Commit changes with git and push to github.
    * Don't push the gem to rubygems.org!

!SLIDE questions just-title
# Questions?
