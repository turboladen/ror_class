!SLIDE bullets
# Why Rails?

* _Wait, why are you here?_

!SLIDE bullets incremental
# Why Rails? (cont.)

* Full stack web development
    * DB access
    * Provisions for managing CSS & JS
* Lets you build apps _without_ being a master at...
    * TCP
    * DBs/SQL
    * CSS
    * JS
    * DevOps

.pull-right (cont.)

.notes Startups

!SLIDE bullets incremental
# Why Rails? (cont.)

* It's Ruby! ...Do a lot with little work.
* Conducive to team collaboration.
    * Lets you get right to solving the problem.
    * Accommodates change easily.
* Well-designed and organized.
    * Model-View-Controller.
    * RESTful out of the box.

.pull-right (cont.)

!SLIDE bullets incremental
# Why Rails? (cont.)

* Support.
    * Support for all kinds of DBs.
    * Lots of plugins: write less code!
* Database migrations.
* It's easy...
    * to manage dependencies.
    * to test.
    * to deploy.
* Jobs!

!SLIDE bullets incremental
# Why *NOT* Rails?

* There's a lot to learn besides Ruby.
    * ERB or HAML for HTML
    * SASS for CSS
    * CoffeeScript for JavaScript
    * Rails
    * MVC
    * Testing framework
    * capybara, selenium
    * rake
    * capistrano

!SLIDE smbullets incremental
# Why *NOT* Rails? (cont.)

* Overkill for your project.
* Magic!
* Can be confusing to debug.
* Ruby doesn't sit well with you.
* Lacking performance
    * 99% of the time, this is is lies!

!SLIDE questions title commandline incremental

```
$ puts "questions?"
```

!SLIDE bullets incremental
# Why Ruby?

* _Who here wants to learn Ruby as much as/more than Rails?_
* You can learn a lot about Ruby from learning Rails.

!SLIDE bullets incremental
# Why Ruby?

* ["Why Ruby?"](http://www.codinghorror.com/blog/2013/03/why-ruby.html) by Jeff Atwood
* Let's you get to solving the problem.
* It's consistently object-oriented.
    * _Everything_ is an object!
* Reflection: Lets you learn it by asking it.
* Flexibility...
    * ...can mean readability.
    * Lots of optional syntax.

.pull-right (cont.)

!SLIDE bullets incremental
# Why Ruby? (cont.)

* You have access to it at every level.
* Ecosystem.
    * RubyGems & Bundler.
    * Wonderful documentation & doc tools; self-documenting code.
* Rails?
* Great testing frameworks.
* Lots of DevOps tools written in Ruby.

.pull-right (cont.)

!SLIDE bullets
# Why Ruby? (cont.)

* Lots of VMs
    * MRI ("Matz' Ruby Interpreter", aka "C Ruby")
    * JRuby
    * RubyMotion/MacRuby
    * Rubinius (Ruby written in Ruby)
    * mruby (for embedded devices)
    * IronRuby (.NET)
    * ruby-python
    * etc.

.pull-right (cont.)

!SLIDE bullets incremental
# Sidenote: Software Maintainability

* ["Over 90% of the cost of software development is software maintenance."](http://tynerblain.com/blog/2007/02/28/agile-development-roi-2/)
* [ISO 9126](http://en.wikipedia.org/wiki/ISO/IEC_9126), Quality Characteristics:
    * Analyzability
    * Changeability
    * Stability
    * Testability

.pull-right (cont.)

!SLIDE bullets incremental
# Sidenote: SW Maintainability (cont.)

* How to mitigate?
    * Write less code!
        * [Don't Repeat Yourself](http://en.wikipedia.org/wiki/Don't_repeat_yourself)
          (DRY)
        * [You ain't gonna need it](http://en.wikipedia.org/wiki/You_aren't_gonna_need_it)
          (YAGNI)
    * Write better code!
    * Write tests that live with the code.
    * Write docs that live with the code.
    * Follow [design patterns](http://en.wikipedia.org/wiki/Software_design_pattern).
    * [Red, Green, Refactor](http://www.jamesshore.com/Blog/Red-Green-Refactor.html).
* Ruby is really good for mitigating these things.

!SLIDE
# Why Ruby?

## Ruby lends itself to writing maintainable code.

!SLIDE
# Why *NOT* Ruby?

* It doesn't feel right.
* You can do really dumb things.
* Too much flexibility.
* Performance?
* Not compiled (usually).
* Not pre-installed on most OSes.


!SLIDE questions title

```ruby
> puts "questions?"
```

!SLIDE smbullets incremental
# Object-Oriented Programming

* _Hooooold up.... why programming?_
* Make these computers do stuff for us.
* _Ok, how?_
* Write some text in a file, feed it to a program, and it turns it into `01`s.
* _Why all these languages??_
* Good question.
    * Some are geared at helping you solve specific problems.
    * Some are geared at solving many problems.
    * Some just "make sense" to you.
    * ...but let's leave this question to the Platos...

!SLIDE bullets incremental
# OOP (cont.)

* Is not Procedural Programming.
    * Focus is on the steps involved to make something happen.
    * Ex. C, Fortran, Go, Perl, PHP, Rust, Visual Basic
* Is not Functional Programming.
    * Focus is on mathematical functions; no state.
    * Ex. Haskell, Erlang, Lisp
* Focus of programming is on nouns--the objects--and their attributes and
  abilities.
    * Ex. C#, C++, Fortran, Java, Lua, Objective-C, Perl, PHP, Python, Smalltalk...
* Lots of other programming paradigms, but these 3 are popular.

!SLIDE bullets
# OOP (cont.)

* FWIW, Ruby is inspired by:
    * Ada
    * C++
    * Eiffel
    * Lisp
    * Perl
    * Python
    * Smalltalk

!SLIDE bullets incremental
# OOP: The Car Example

The ol' car example...

* A car (<- noun) is made up of:
    * an engine
    * a transmission
    * wheels and tires
    * a steering system
* A car can:
    * start and stop
    * go forward and backwards
    * turn left and right

!SLIDE bullets incremental
# OOP: The Car Example (cont.)

* The car also carries state:
    * off
    * running, not in motion
    * running, in gear, not in motion
    * etc


!SLIDE bullets incremental
# OOP: The Car Example (cont.)

OK, great... now how about those parts?

* The engine is made up of:
    * pistons
    * valves
    * block
    * etc
* The engine can:
    * turn on/off
    * increase/decrease RPM
    * etc

!SLIDE bullets incremental
# OOP: The Car Example (cont.)

So would if you wanted to write a program to be a car, would it be easier to
express that as...

* A) a set of steps to execute?
* B) a set of functions that make the car do things?
* C) a set of objects that do things on their own and interact with each other?
* Obviously, the right answer is C.
* Easy for humans to relate and talk about objects, thus better code (?).

!SLIDE smbullets
# OOP Summary

* Some argue that in order to build a good app, developers must be able to have
  a good mental model that maps to the app.
* Writing programs that treat its internals as objects can help this mental
  modeling.
* Ruby is an OOP language, but can act as other types.

!SLIDE questions title

```ruby
> puts "questions?"
```
