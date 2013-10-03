!SLIDE title
# Rails and APIs


!SLIDE
# What?  Why?

* Do you want to give programmatic access to your app?
* Wanting to do heavy client-side work?
    * (i.e. JS frameworks, like Ember, Backbone, Angular)
* JSON is common, but doesn't have to be.


!SLIDE bullets
# Resources

* General:
    * [rails-api](https://github.com/rails-api/rails-api)
    * [RailsCast #348: The Rails API Gem](http://railscasts.com/episodes/348-the-rails-api-gem)
* Versioning:
    * [RailsCast #350: REST API Versioning](http://railscasts.com/episodes/350-rest-api-versioning)
* Serializing:
    * [active_model_serializers](https://github.com/rails-api/active_model_serializers)
    * [jbuilder](https://github.com/rails/jbuilder)
    * [rabl](https://github.com/nesquena/rabl)
    * [builder](http://builder.rubyforge.org)
    * [builder in rails](http://guides.rubyonrails.org/action_view_overview.html#templates-partials-and-layouts)


!SLIDE bullets
# Resources (cont.)

* Security:
    * [ActionController::HttpAuthentication::Token](http://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Token.html)
    * [RailsCast #352: Securing an API](http://railscasts.com/episodes/352-securing-an-api)


!SLIDE
# What if I want HTML _and_ a Web Service?

* You have options:
    * Keep standard controllers and handle all content types
    * Separate out HTML vs API controllers
* I like the latter:
    * single responsibility for each
    * testing is easier
    * most likely, controller code will diverge


!SLIDE
# Flockr API?

* I got nothin yet!
* Live coding??


!SLIDE questions center
# Questions?
