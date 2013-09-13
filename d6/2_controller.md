!SLIDE title
# Our Controllers
## (and routes)


!SLIDE incremental bullets
# We want /photos/[username]/

* Right now we've got:
    * `/users`
    * `/photos`
* Let's take baby steps here...
    * `/users/:user_id/photos`
* Change the route...
    * Edit [config/routes.rb](https://github.com/turboladen/ror_class/commit/75f2173469da56dd93756af7f1cfc85925914d50)
    * Run the specs...
* Check the new routes...

    ```
    $ rake routes
    ```


!SLIDE incremental
# We want /photos/[username]/ (cont.)

* Try getting to http://localhost:3000/users
* Try getting to http://localhost:3000/users/1
* Try getting to http://localhost:3000/users/1/photos
* Fix all of the things...
    * [lots of files](https://github.com/turboladen/ror_class/commit/da43086907e3a8311d8da2410f3f2870ea3f4bd0)
* Try getting to http://localhost:3000/users
* Try getting to http://localhost:3000/users/1
* Try getting to http://localhost:3000/users/1/photos


!SLIDE
# Git it!

* Add the newly generated files to the repo.
* Commit the changes, saying "Made photos a sub-resource to users."


!SLIDE incremental
# Homework: Add `/home`

* Let's check things from the outside...
    * Run `rails server`.
    * Go to http://localhost:3000.
* Not helpful.  Let's add `/` that maps to `/home`.
* How do we tell Rails to handle requests on some URI?
* Add the route:
    * [config/routes.rb](https://github.com/turboladen/ror_class/commit/bd8047b1f85a779483c8ce6971d734861bc8f2dc)
    * Refresh on http://localhost:3000.
* We need a controller to route that to!


!SLIDE incremental bullets
# Home Controller

* Add the controller.

    ```bash
    $ rails generate controller Home index
    ```
    * Remove the generated line from `config/routes.rb`.
* Refresh on http://localhost:3000.
* Why no scaffolding?  or resource?


!SLIDE
# Git it!

* Add the newly generated files to the repo.
* Commit the changes, saying "Generated Home controller."


!SLIDE bullets
# Controllers need views

* Edit `app/views/home/index.html.erb`.
    * [my home](https://github.com/turboladen/ror_class/commit/523bb3ae88dfa663847ca8d0a51d22382235a7a4)
