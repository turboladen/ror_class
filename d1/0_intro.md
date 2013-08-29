!SLIDE center just-title
# Geekwise: Ruby on Rails

## Day 1/12

!SLIDE
# Today's Goals

1. Understand why we're here.
+ Setup and install tools we need.
+ Setup and install Ruby.
+ Get our fingers wet with a little code.

!SLIDE
# Class Goals

1. Learn Ruby basics.
+ Learn how to learn Ruby.
+ Learn Ruby ecosystem.
+ Get your Rails sea legs.
+ Get familiar with tools involved in making Ruby/Rails libraries/apps.

!SLIDE
# Class Overview

* Get the slides: [http://geekwise-ror.herokuapp.com](http://geekwise-ror.herokuapp.com)
* Let's check the [itinerary](http://geekwise-ror.herokuapp.com/itinerary).

!SLIDE bullets
# Class Coding/Reviewing Workflow

* While in class...
    * we write code,
    * I review while we're here.
* While at home...
    * you write code,
    * you commit code to github;
    * create a pull request when done,
    * add me as a reviewer;
    * I will review before next Wednesday.

!SLIDE bullets
# Stuck?

* http://rubygroupies.github.io
* http://irc.lc/freenode/ruby-lang
* http://irc.lc/freenode/rails
* http://stackoverflow.com
* http://www.reddit.com/r/ruby
* http://www.reddit.com/r/rails


!SLIDE
# Overview for Today

* Stuff you should read.
* About me.
* What you will know.
* What you will make.
    * Ruby project
    * Rails project
* Why Rails?
* Why Ruby?
* OO programming.

!SLIDE smbullets
# Overview for Today (cont.)

* Tools
    * IDEs
    * Git & Github
    * Heroku
    * Vagrant
* Installing Ruby
* IRB
* `Hello World!`


!SLIDE bullets
# README (Ruby)

* [Programming Ruby](http://pragprog.com/book/ruby4/programming-ruby-1-9-2-0),
  by Dave Thomas & Andrew Hunt
    * aka "the pickaxe".
    * Get the Ruby 2.0 edition.
    * <u>**I will pull material from this book.**</u>
* [The Ruby Programming Language](http://www.amazon.com/The-Ruby-Programming-Language-ebook/dp/B0026OR3JO/ref=sr_1_1?s=books&ie=UTF8&qid=1374625977&sr=1-1&keywords=the+ruby+programming+language),
  by David Flanagan & Yukihiro "Matz" Matsumoto
    * Matz = Ruby creator.
* [Why's (Poingnant) Guide to Ruby](http://mislav.uniqpath.com/poignant-guide/),
  by [\_why_the_lucky_stiff](http://en.wikipedia.org/wiki/Why_the_lucky_stiff)
    * Not like any programming book you'll ever read.


!SLIDE bullets
# README (Ruby) (cont.)

* [Metaprogramming Ruby](http://pragprog.com/book/ppmetr/metaprogramming-ruby),
  by Paolo Perrotta
    * Good for learning Ruby's innards & "magic".
* [Eloquent Ruby](http://www.amazon.com/Eloquent-Addison-Wesley-Professional-Series-ebook/dp/B004MMEJ36/ref=pd_sim_b_1),
  by Russ Olsen
    * Good for learning to think in Ruby.
* [Design Patterns in Ruby](http://www.amazon.com/Design-Patterns-Addison-Wesley-Professional-ebook/dp/B0010SEN1S/ref=sr_1_1?s=books&ie=UTF8&qid=1374626499&sr=1-1&keywords=design+patterns+in+ruby),
  by Russ Olsen
    * I've referred to this book so many times...
* [Refactoring: Ruby Edition](http://www.amazon.com/Refactoring-Ruby-Addison-Wesley-Professional-ebook/dp/B002TIOYWG/ref=sr_1_2?s=books&ie=UTF8&qid=1374626548&sr=1-2&keywords=refactoring+in+ruby),
  by Jay Fields, Martin Fowler, Kent Beck, Shane Harvie


!SLIDE bullets
# README (Rails)

* [Agile Web Development with Rails 4](http://pragprog.com/book/rails4/agile-web-development-with-rails-4),
  by Sam Ruby and others
    * Partly written by DHH.
    * <u>**I will pull material from this book.**</u>
* [The Rails 4 Way](https://leanpub.com/tr4w), by Obie Fernandez and others
    * I've never used, but popular.
* http://guides.rubyonrails.org
    * Lots of getting started info.
* http://railscasts.com, Ryan Bates
    * Shows how to solve lots of common problems.

!SLIDE bullets
# README (Rails) (cont.)

* [Ruby on Rails Tutorial](http://ruby.railstutorial.org/ruby-on-rails-tutorial-book),
  by Michael Hartl
    * Highly recommended (by Rails peeps) online book.
* [Crafting Rails 4 Applications](http://pragprog.com/book/jvrails2/crafting-rails-4-applications),
  by José Valim
    * "Expert Practices for Everyday Rails Development."


!SLIDE questions title commandline incremental

```
$ puts "questions?"
```
