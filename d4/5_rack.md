!SLIDE center
# Rack

!SLIDE
# Rack Intro

* ["Rack: a Ruby Webserver Interface"](http://rack.github.io/)
* "...provides a minimal interface between webservers supporting Ruby and Ruby
  frameworks."
* It defines a [protocol](http://rack.rubyforge.org/doc/SPEC.html).
* [Rails on Rack](http://guides.rubyonrails.org/rails_on_rack.html):

> By wrapping HTTP requests and responses in the simplest way possible, it
> unifies and distills the API for web servers, web frameworks, and software in
> between (the so-called middleware) into a single method call.



!SLIDE bullets
# Rack Intro (cont.)

* Most Ruby web frameworks "sit" on Rack.

![request](/images/rack.png)

!SLIDE bullets incremental
# What does Rack get you?

* Request Info
    * Who made the request
    * How the request was made
    * Environment info when the request was made
    * Parsed request headers
    * Request body
* Middleware
* Response Info
    * Status
    * Easy header setting
    * Easy body setting


!SLIDE bullets incremental
# Why should I care?

* It's the core to Rails.

!SLIDE bullets
# In fact, use Rack alone...

* `config.ru`:

    ```ruby
    app = lambda do |env|
      body = "Hello, World!"
      headers = { "Content-Type" => "text/plain", "Content-Length" => body.length.to_s }

      [200, headers, [body]]
    end

    run app
    ```
* Then, run:

    ```bash
    $ rackup --port 3000
    $ curl -v -L http://localhost:3000
    ```

!SLIDE bullets
# Want to define that as a class?

* `config.ru`:

    ```ruby
    class HelloWorld
      def call(env)
        body = "Hello, World!"
        headers = { "Content-Type" => "text/plain", "Content-Length" => body.length.to_s }

        [200, headers, [body]]
      end
    end

    run HelloWorld.new
    ```

!SLIDE bullets
# A Rack App is...

1. A Ruby object (not a class) that responds to `call`.
+ It takes 1 argument: the **environment**.
+ It returns an Array of exactly 3 values:
    * **status**
    * **headers**
    * **body**


!SLIDE incremental
# Notes so far

* "App" can be a method, a block, or a whole lot of anything built on top of
  something that responds to `call`.
* BTW, duck typing here with `call`!
* `Rails::Server` subclasses `Rack::Server` and hooks in to it.
* Using `Rails::Server` is similar to using the `config.ru` file.


!SLIDE bullets
# Multiple Routes/Resources?

* Sure!

    ```ruby
    inspector = proc do |env|
      [200, { 'Content-Type' => 'text/html' }, [env.inspect]]
    end

    noper = proc do |env|
      [404, { 'Content-Type' => 'text/html' }, ['NEWP!!!']]
    end

    builder = Rack::Builder.new do
      map '/' do
        run inspector
      end

      map '/nope' do
        run noper
      end
    end

    run builder
    ```

!SLIDE bullets
# So Far, Summary

* Access environment info.
* Easy-ish to give response status, headers, and body.
* Different functionality per mapped location.


!SLIDE bullets
# Middleware

* Rack-compliant objects that are added into the stack.

    ```ruby
    require 'rack'
    require 'rack/contrib'

    use Rack::Profiler if ENV['RACK_ENV'] == 'development'
    use Rack::Locale
    use Rack::MailExceptions

    class HelloWorld
      def call(env)
        body = "Hello, World!"
        headers = { "Content-Type" => "text/plain", "Content-Length" => body.length.to_s }

        [200, headers, [body]]
      end
    end

    run HelloWorld.new
    ```


!SLIDE bullets
# Our own middleware?

* `cat_checker.rb`

```ruby
require 'open-uri'

class CatChecker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    if body.include? 'cat'
      image = open('http://placekitten.com/g/200/300')
      body << image
    end

    [status, headers, body]
  end
end
```

.pull-right ...then...

!SLIDE bullets
# Our own middleware? (cont.)

* `config.ru`

```ruby
require_relative 'cat_checker'

class HelloWorld
  def call(env)
    body = "Hello, World!"
    headers = { "Content-Type" => "text/plain", "Content-Length" => body.length.to_s }

    [200, headers, [body]]
  end
end

use CatChecker

run HelloWorld.new
```

!SLIDE bullets incremental
# Ok, what's all that get me?

* Access to everything in the request.
* Access to everything in the response.
* Ability to do things as a result of attributes of the request.
* Add info to `env` that other middleware or apps can get to.
* Modularity!
    * App does what the app is for.
    * Each middleware has its one responsibility.
* In essence, a tool to build your app around.

!SLIDES bullets incremental
# But...

* It's not geared towards building a web site with, is it?
* Not really--leaves a lot to be desired.
* Can you imagine writing a full-blown web site using this?

!SLIDE center questions
# Questions?
