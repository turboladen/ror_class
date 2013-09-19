!SLIDE title
# Authentication: Sign In/Out



!SLIDE
# Sessions

* Wikipedia, ["Session"](http://en.wikipedia.org/wiki/Session_(computer_science))
* Allows for sharing data between server and browser.
* We'll use session variables to store data in the browser.
* We want Flockr users to be able to:
    * Create new user sessions (aka "sign in")
    * Delete existing user sessions (aka "sign out")


!SLIDE bullets
# To pick up where we left off...

* If you've forked my repo:

    ```bash
    $ git branch some_new_branch
    $ git checkout some_new_branch
    $ git rebase 48f0cc813dd6adbb5e37fb9dc0cf4b677cedba80
    ```
* If no fork:

    ```bash
    $ git remote add turboladen git@github.com:turboladen/flockr.git
    $ git fetch turboladen add_authentication
    $ git merge 48f0cc813dd6adbb5e37fb9dc0cf4b677cedba80
    ```

!SLIDE
# SessionsController

* Let's create a controller to handle this, RESTfully.
* Actions:
    * `GET /sessions/new` => `sessions#new`
    * `POST /sessions` => `sessions#create`
    * `DELETE /sessions/:id` => `sessions#destroy`
* Why `new` _and_ `create`?
* What should we do first?


!SLIDE bullets
# Why, test of course!

* Features first...
    * [spec/features/authentication_spec.rb](https://github.com/turboladen/flockr/commit/2ff3aa5abb93b65269a9d4052b467acc34f927fb)
* Run the tests...
    * Fails, right?
* Time to add our sessions code...


!SLIDE bullets
# Generator time!

* Don't need a `Session` model, so just the other stuff, please:

    ```bash
    $ rails g controller sessions new create destroy
    ```
* Fix routes...

    ```ruby
    resources :sessions, only: %i[new create destroy]
    get '/sign_up' => 'users#new'
    get '/sign_in' => 'sessions#new'
    delete '/sign_out' => 'sessions#destroy'
    ```
* Run the tests...
    * New failure, right?


!SLIDE bullets
# Fix the views

* Like this:
    * [app/views/sessions/new.html.erb](https://github.com/turboladen/flockr/commit/6edb5d89b79abc31393968f3d9c56003f1db3af5)
    * What's that form doing exactly?
    * Check out the HTML in http://localhost:3000/sign_in.
* Rerun the tests...
    * Passes, right?
* Try http://localhost:3000/sign_in and sign in.
* So that test isn't really _that_ helpful... How come?
* ...let's fix.
    * [spec/features/authentication_spec.rb](https://github.com/turboladen/flockr/commit/6b4f76c70a5b8be8b67b69ab225f52e28b7bebcc)


!SLIDE bullets
# Real Controller Work

* `sessions#new` needs to:
    * Find a user associated with the username.
    * Authenticate the user with the given password.
    * Create the session.
* Must account for 2 cases:
    * Authentication succeeds
    * Authentication fails
* What to do in each case?
    * Success: redirect to the user's page.
    * Fail: re-render the form, but flash an error.

!SLIDE bullets
# Real Controller Work (cont.)

* Let's look at that:
    * [app/controllers/sessions_controller.rb](https://github.com/turboladen/flockr/commit/3e5e9295b2ae31c3d0ae532059495e6a1e66722c)


!SLIDE smbullets incremental
# Hooking up the Controller

* Add `#sign_up` that creates the session.
* But before that, we need a way to identify and store our session.
* We want to keep the session alive until the user explicitly logs out.
    * (This means even if they close the browser.)
* How to do this?
    * Client-side session variable.
    * Server-side token.
* If server-side... -> storing data... -> database time!


!SLIDE bullets incremental
# Remember Token

* Store `remember_token` as part of the `User`. ...but how?
* Migration time!

    ```bash
    $ rails g migration add_remember_token_to_users remember_token:string
    ```
    * Now add a DB index on `remember_token`.
* RSpec time!
    * In `spec/models/user_spec.rb`:

    ```ruby
    it { should respond_to(:remember_token) }
    ```
* Migrate and run them...
    * Passes, right?


!SLIDE smbullets incremental
# Remember Token (cont.)

* Still need to determine how to generate the token to save in the DB...
* How about:
    * base64 in the browser (client-side).
    * encrypted version of the base64 number in the DB.
* We should also create a new token with each new session.
* We also shouldn't rely on setting the token on login
    * ...users should start off with one.
* Business logic, thus we need some `User` model action.
* Let's do all of that stuff:
    * [Changes](https://github.com/turboladen/flockr/commit/b745dee4ad41f744424ce478519b8c304ff49cf1)


!SLIDE bullets
# Sidenote: Model Callbacks

* When creating (i.e. not updating), in order:
    * `before_validation`
    * `after_validation`
    * `before_save`
    * `around_save`
    * `before_create`
    * `around_create`
    * (database commit)
    * `after_create`
    * `after_save`
* More info [here](http://edgeguides.rubyonrails.org/active_record_callbacks.html).


!SLIDE incremental
# Controller & View Help!

* Remember our `#sign_in` method?
* We want access to it in views _and_ controllers.
* Let's add it to the `SessionsHelper` module:
    * [app/helpers/sessions_helper.rb](https://github.com/turboladen/flockr/commit/49ea75bd659c0b90185fb7e5a8b8a70c0124ee21)
* Run the specs...
    * Still failing, right?
* We need to add `current_user`...


!SLIDE incremental bullets
# Controller & View Help! (cont.)

* Adding `current_user` gets us:
    * Easy way to access who's logged in within view or controller code.  I.e.:

    ```ruby
    current_user.photos
    ```
* Let's do it...
    * [app/helpers/sessions_helper.rb](https://github.com/turboladen/flockr/commit/f8dfbdcdfaf1e6b28d83b6b800b5386cdebd2716)
* Now let's change our layout to detect if we're signed in or not:
    * [app/views/layouts/application.html.erb](https://github.com/turboladen/flockr/commit/d4e7aeb3b08c4f4ea45a4d843d013d5480fc6d74)
* Now try signing up!
    * http://localhost:3000/sign_up


!SLIDE incremental bullets
# Controller & View Help! (cont.)

* Confusing, eh?  Expected to be signed in after signing up?
* First, try signing in...
    * http://localhost:3000/sign_in
* Works, right?
* Sign out?  ...weirdness.  Let's fix:
    * [Changes](https://github.com/turboladen/flockr/commit/810273f605211223906739dd4efc080335661309)
* Now, let's add sign-in after sign-up:
    * [app/controllers/users_controller.rb](https://github.com/turboladen/flockr/commit/cee363b100040c749f267efba4e1ed37a19d3c5b)
* Now, try it all out!


!SLIDE
# Ok, what's missing?

* Tests:
    * View specs
    * Controller specs
    * Helper specs
    * Feature specs
* Guess what... homework!
* 'Sign Up' link on `/sign_in`?
* Anything else?

