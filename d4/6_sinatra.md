!SLIDE center
# Sinatra

!SLIDE bullets
# Can you figure out what this does?

* `hello.rb`:

    ```ruby
    require 'sinatra'

    get '/' do
      'Hello World!'
    end
    ```
* Then:

    ```bash
    $ ruby hello.rb
    ```

!SLIDE bullets
# Sinatra Intro

* http://www.sinatrarb.com/intro.html:

> Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort.

!SLIDE bullets
# Params

```ruby
get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  "Hello #{params[:name]}!"
end

get '/say/*/to/*' do
  # matches /say/hello/to/world
  params[:splat] # => ["hello", "world"]
end

get %r{/hello/([\w]+)} do
  "Hello, #{params[:captures].first}!"
end

get '/posts.?:format?' do
  # matches "GET /posts" and any extension "GET /posts.json", "GET /posts.xml" etc.
end
```

!SLIDE bullets
# Templates

* For your HTML (or whatever your serving to users).
* `app.rb`:

    ```ruby
    get '/' do
      erb :index
    end
    ```
* `views/index.erb`:

    ```erb
    <h1>Hi!</h1>
    <p>This is my app.<p>
    ```

!SLIDE smbullets
# Template Languages

* Not limited to these here, but...
* HTML
    * ERB
    * HAML
    * Markdown
    * Textile
* JSON
    * rabl
* XML
    * Builder
    * Nokogiri
* CSS
    * Sass
    * Less
    * Liquid

!SLIDE bullets incremental
# More Response Access

* Status, headers, and body:

    ```ruby
    get '/foo' do
      status 418
      headers \
        "Allow"   => "BREW, POST, GET, PROPFIND, WHEN",
        "Refresh" => "Refresh: 20; http://www.ietf.org/rfc/rfc2324.txt"
      body "I'm a tea pot!"
    end
    ```
* Look familiar?

!SLIDE bullets
# Sessions?

```ruby
enable :sessions

get '/' do
  "value = " << session[:value].inspect
end

get '/:value' do
  session[:value] = params[:value]
end
```

* (The 2nd route sets the session variable, the first returns it.)


!SLIDE bullets
# How about streaming?

```ruby
get '/' do
  stream do |out|
    out << "It's gonna be legen -\n"
    sleep 0.5
    out << " (wait for it) \n"
    sleep 1
    out << "- dary!\n"
  end
end
```

* Not quite websockets, but almost there with not much more work...

!SLIDE smbullets
# What else?

* Layouts
* File sending
* Logging
* Testing helpers
* Wrapper methods around Rack's `env`, making code more readable.
* "environments"
* Rack middleware! (duh)
* Lots of other little things.


!SLIDE bullets incremental
# Hmm...

* So that's neat, but can you envision building a full-blown site on that?
* What about a web service/API?
* Very few file organization conventions.
* How would you choose to separate files?
* How about DB related stuff?
* Lets you do a lot with little, but makes you decide a lot.

!SLIDE bullets
# Rails

* Rails adds some complexity...
    * ...but provides a lot of convention, so you don't have to make decisions.
    * ...but you can stray from convention when you need to.
* Is Rails _better_?
    * It depends on the problem you're trying to solve!

!SLIDE questions center
# Questions?
