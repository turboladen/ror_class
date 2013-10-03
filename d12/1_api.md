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
    * [grape](http://intridea.github.io/grape/)
* Versioning:
    * [RailsCast #350: REST API Versioning](http://railscasts.com/episodes/350-rest-api-versioning)
    * [versionist](https://github.com/bploetz/versionist)
    * [api-versions](https://github.com/EDMC/api-versions)


!SLIDE bullets
# Resources (cont.)

* Serializing:
    * [jbuilder](https://github.com/rails/jbuilder)
    * [rabl](https://github.com/nesquena/rabl)
    * [active_model_serializers](https://github.com/rails-api/active_model_serializers)
    * [builder](http://builder.rubyforge.org)
    * [builder in rails](http://guides.rubyonrails.org/action_view_overview.html#templates-partials-and-layouts)
* Security:
    * [ActionController::HttpAuthentication::Token](http://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Token.html)
    * [RailsCast #352: Securing an API](http://railscasts.com/episodes/352-securing-an-api)


!SLIDE bullets
# What if I want HTML _and_ a Web Service?

* You have options:
    * Keep standard controllers and handle all content types
    * Separate out HTML vs API controllers
* I like the latter:
    * single responsibility for each
    * testing is easier
    * most likely, controller code will diverge


!SLIDE bullets
# Flockr API?

* Requirements:
    * JSON only.
    * Use jbuilder (it's default) for JSON.
    * Versioning using URL only (it's simple).
* To do:
    * Create `/api/v1/` routes.
    * Separate HTML vs. API controllers.
    * Update jbuilder templates.


!SLIDE bullets
# Flockr API In Action

* http://flockr-turboladen.herokuapp.com/api/v1/users.json
* Add a user?

    ```http
    POST /api/v1/users

    {
    	"user" : {
    		"email" : "bobo@clowns.com",
    		"username" : "bobo",
    		"password" : "sosad",
    		"password_confirmation" : "sosad"
    	}
    }
    ```
* Go login with it via HTML...


!SLIDE bullets
# Flockr API In Action (cont.)

* Add a photo?

    ```http
    POST /api/v1/users/1/photos

    {
    	"photo" : {
    		"file_name" : "me.jpg",
    		"path" : "me.jpg",
    		"image" : "Base64 encoded file...",
    	}
    }
    ```
* Let's just add from HTML...


!SLIDE bullets
# Flockr API In Action (cont.)


* View photos?

    ```http
    GET /api/v1/users/1
    ```
    * (photos are on users#show)
* Commenting on photos is similar.


!SLIDE bullets
# How it does that?

* https://github.com/turboladen/flockr/commits/api
* https://github.com/turboladen/flockr/pull/8/files


!SLIDE
# Notes

* Directory structure nesting correlates to subclassing.
    * `api/v1/users_controller.rb' => `Api::V1::UsersController`
* Controllers inherit from `ApiController` now instead of `ApplicationController`.
* `respond_to` at the top of controllers.
* URL helpers for API are now prefaced with `api_v1_...`.
* Error handling needs help to return JSON.
* Jbuilder helps with non-default (`#to_json`) building.


!SLIDE
# Next Steps

* Want to slim controllers even more?  Try `respond_with`:
    * http://blog.plataformatec.com.br/tag/respond_with/
* Authentication.
    * Tokens?
    * API keys?
    * Sessions?
    * Both?
* Allow Base64 decoding of images for uploading.


!SLIDE questions center
# Questions?
