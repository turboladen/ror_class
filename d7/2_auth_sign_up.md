!SLIDE title
# Authentication in the Controller & Views


!SLIDE
# Let's Get Purdy First

* We'll use style & UI functionality from [Twitter Bootstrap v3](http://getbootstrap.com)
* [bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass)
* Add to `Gemfile`:

    ```ruby
    gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
    ```
* `bundle install`
* Include CSS and JS into Rails' "asset pipeline":
    * In `app/assets/stylesheets/application.css`:

        ```css
         *= require bootstrap
        ```
    * In `app/assets/javascripts/application.js`:

        ```javascript
        //= require bootstrap
        ```
* Check out http://localhost:3000...


!SLIDE
# Layouts

* Provides reusable HTML for your views.
* In `app/views/layouts/`.
* Without specifying, Rails uses `app/views/layouts/application.html.erb`.
* Works by using `yield`, like with blocks.
* Let's fix ours:
    * [app/views/layouts/application.html.erb](https://github.com/turboladen/flockr/commit/27ecf04f58ac8e1cddd73b40ffb8795223f57b1b)
    * Just suck in these changes:

        `$ git cherry-pick 24aa4410cf183d6485dda23d05943f871a93507f`


!SLIDE
# Update the Route & View

* Let's BDD this one, using [capybara](https://github.com/jnicklas/capybara).
* Update `:test` group of `Gemfile` to use `capybara`.
* `bundle install`.
* Tell RSpec to require Capybara...
    * Edit `spec/spec_helper.rb`

        ```ruby
        require 'capybara/rails'
        ```
* Create `spec/features/authentication_spec.rb`.
    * [Changes](https://github.com/turboladen/flockr/commit/c697c6940e24c4f9e3456de757a0be241952430a).


!SLIDE
# Update the Route & View (cont.)

* `/sign_up`
    * Could use the existing `/users/new`, but that's no fun.
* Add to the routes in `config/routes.rb`:

    ```ruby
    get '/sign_up' => 'users#new'
    ```
* Check each in the browser...
    * Same content!
* Run the feature specs...

    ```bash
    $ rspec spec/features
    ```

!SLIDE
# Update the Route & View (cont.)

* `app/views/users/new.html.haml`
    * Whoa, _partials_!
* `app/views/users/_form.html.haml`
* It uses `form_for(@user)`...
* Update to match our spec...
    * [Changes](https://github.com/turboladen/flockr/commit/7a08c94f043ef9b592f50fc9ee34120a532fa00b).
* Run the feature specs...

    ```bash
    $ rspec spec/features
    ```
    * Fails, right?
* Try http://localhost:3000/sign_up...
    * Fails, right?

!SLIDE
# Update the Route & View (cont.)

* Before we fix, how about a link to `/sign_up`?
* Edit `app/views/layouts/application.html.erb`
    * [Changes](https://github.com/turboladen/flockr/commit/51d0d4b2098163d72dcf90c104c52daa11810b9c).


!SLIDE
# Now to the Controller

* "strong parameters"
    * Filters crap (aka potentially unsafe params).
* Permit `password` and `password_confirmation` through:
    * [app/controllers/users_controller.rb](https://github.com/turboladen/flockr/commit/fc5adf1fc68112fc047b69d66e2d871f51984f72).
* Run the feature specs...

    ```bash
    $ rspec spec/features
    ```
* Try http://localhost:3000/sign_up...


!SLIDE
# Now to the Controller (cont.)

* Lastly, let's fix those specs and make a nicer welcome message...
    * [app/controllers/users_controller.rb](https://github.com/turboladen/flockr/commit/9ea9394702934978fcb0961731bc3a37a5d01aa7)
* Try http://localhost:3000/sign_up...


!SLIDE
# Bootstrapping our Views


