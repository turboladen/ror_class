!SLIDE title
# CRUD
## Create, Read, Update, Delete


!SLIDE bullets incremental
# What is CRUD?

* "the four basic functions of persistent storage." ([Wikipedia](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete))
* When talking HTTP:
    * **C**reate = POST
    * **R**ead = GET
    * **U**pdate = PUT / PATCH
    * **D**elete = DELETE
* HTTP request methods = verbs/actions on resource.
    * Not familiar with HTTP request methods?  Click [here](http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods).


!SLIDE bullets incremental
# OK, what's a resource?

* Can be many different things...
    * Database entry
    * File
    * List of other resources
    * etc.
* ...but it's the representation of a _thing_:
    * http://myblog.com/posts/I-like-pizza
    * http://en.wikipedia.org/wiki/Web_resource
    * http://www.google.com/search?q=http+resources
    * [Twitter's API resources](https://dev.twitter.com/docs/api/1.1)
* Look at `rails generate resource --help`...


!SLIDE bullets incremental
# OK, what's a resource? (cont.)

* In Rails, a resource is defined by:
    * route
        * how Rails will direct the HTTP request based on URI & HTTP verb.
    * controller & its actions
        * what Rails will do with HTTP request after routed.
    * the model
        * the data the HTTP request is looking for.


!SLIDE bullets incremental
# Back to train_maker...

* When we generated `scaffold TrainCar`, we generated:
    * code for the `train_cars` related resources.
        * routes
        * Controller-related
        * DB-related
    * all of the view-related code.
    * tests, etc.
* We could've generated `resource TrainCar` and _not_ gotten:
    * Rails' 7 CRUD actions in the controller.
    * view code for each related action.
* Thus, `scaffold` gets you more of a starting ground.


!SLIDE bullets
# What did scaffolding get us?

* Run:

    ```bash
    $ rake routes
    ```
    * 1st col: Ruby method
    * 2nd col: HTTP verb
    * 3rd col: URI
    * 4th col: What the route maps to
* All of our CRUD for `train_cars` is hooked up!

!SLIDE bullets
# CRUD Summary

* Rails will generate CRUDdy code for your resources.


