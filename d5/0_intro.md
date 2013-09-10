!SLIDE title
# Geekwise: Ruby on Rails

## Day 5/12: Intro to Rails

!SLIDE questions center

```ruby
questions.any? { |q| q.created_at > Time.yesterday }
```

### (any questions since last time?)


!SLIDE
# Today's Goals

1. Learn how Rails does the web.
+ Learn how to start a Rails project.
+ Learn some of the basic areas of Rails programming.


!SLIDE smbullets
# Overview for Today

* Review projects
* Installing Rails
* Rack, Rails and the Web
* Models, Views, and Controllers
* CRUD
* Templating
* Creating our in-class project app
* RubyGems & Bundler


!SLIDE questions center

# Questions?

!SLIDE
# Projects

* Our in-class Rails project:
    * We'll build together.
    * It'll cover many topics, but not all.
    * We'll deploy it on Heroku.
    * We'll push it to Github.
* [Your Rails project](d1#22).

!SLIDE questions center

# Questions?

!SLIDE bullets incremental
# Before we install...

* RubyGems provides https://rubygems.org
    * "released" gems are kept here.
    * not limited to that though.
* RubyGems commands to remember:
    * `gem environment`
    * `gem search -r [gem]`
    * `gem install [gem]`
    * `gem uninstall [gem]`
    * `gem help commands`
    * `gem help [command]`
* Also, short commands like `gem env`...


!SLIDE bullets
# Installing Rails

* Surprise, surprise...

    ```bash
    $ gem install rails
    ```
* Or [RailsInstaller](http://railsinstaller.org/en) (OSX and Windows).

!SLIDE bullets

# Create a new project

* Just for fun, do:

    ```bash
    $ rails new train_maker
    ```
* Open `train_maker/config/application.rb`...
    * Convention example!

        ```ruby
        module TrainMaker
        ```
* We'll come back to this project...
