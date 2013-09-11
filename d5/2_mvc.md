!SLIDE title
# Models, Views, and Controllers


!SLIDE
# MVC

> [MVC] is a software architecture pattern which separates the representation of
> information from the user’s interaction with it.

.pull-right -["Model-View-Controller"](http://en.wikipedia.org/wiki/Model–view–controller), Wikipedia

> ...the model is the data, the view is the screen, and the controller is the glue
> between the two.

.pull-right -["Model View Controller](http://c2.com/cgi/wiki?ModelViewController), c2.com


!SLIDE bullets incremental
# MVC (cont.)

* One of many ways to separate responsibilities of code.  See...
    * [Cohesion](http://en.wikipedia.org/wiki/Cohesion_(computer_science))
    * [Single-responsibility principle](http://en.wikipedia.org/wiki/Single_responsibility_principle)
* Think back to Sockets or Rack...
    * How would you organize your code?
* Following MVC gives suggestions about code organization.
* Not just for web applications, but common there.


!SLIDE incremental bullets
# Model

* Object that represents data, thus your app's state.
* Often represents an HTTP resource.

    ```
    http://myblog.com/posts/I-like-pizza
    ```
    * Probably have model representing a "post".
* _Can_ represent a database table.
* Handles business logic for the app's resources.
* Your app will probably have many of these (>= 1 per resource).


!SLIDE incremental bullets
# Controller

* Provides means for changing the state of the app.
* Gets/sets what the user wants out of the app.
* Often represents actions a user can perform on an HTTP resource.

    ```
    GET http://myblog.com/posts/I-like-pizza
    ```
    * A controller for posts probably handles this request.
    * Controller determines what models to access for the requested info.
* Preps the data related to the user's wants for the view.
* Your app will probably have many of these (>= 1 per resource).


!SLIDE incremental bullets
# View

* Displays data from model(s), prepared by a controller.
* Not limited to HTML--it's any representation of the resource.
    * JSON
    * XML
    * binary
    * etc.
* Your app will probably have many of these (>= 1 per resource representation).
    * ("resource representation" = web page, when HTML)


!SLIDE center
# MVC Examples
![wikipedia mvc](http://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/MVC-Process.png/200px-MVC-Process.png)

<img src="http://www.endlick.com/wp-content/uploads/2012/02/mvc_diagram.png" style="width: 400px; height: auto;">


!SLIDE center
# MVC Examples (cont.)

<img src="http://1.bp.blogspot.com/-GMvBz2taYH8/UL4v-8e51HI/AAAAAAAAAFk/RnpdpsNOhjY/s400/mvc_role_diagram.png" style="width: 600px; height: auto;">
![microsoft](http://i.msdn.microsoft.com/dynimg/IC108622.gif)


!SLIDE center
# MVC on Rails

![rails mvc](http://gmoeck.github.io/images/rails_mvc.png)


!SLIDE
# MVC on Rails (cont.)

1. Browser hits the web server.
+ Rails' router determines which controller to send the request to.
+ Controller determines what data to get/set, asks Model(s).
+ Model validates the request, gets/sets data, formatted accordingly, hands back to Controller.
+ Controller hands to View.
+ View renders the data and hands back to Controller.
+ Controller hands back to Ruby web server.
+ Ruby web server hands to web server.


!SLIDE bullets
# MVC on Rails (cont.)

* Organization:
    * Models go in `app/models/`.
    * Views go in `app/views/[controller]/`.
    * Controllers go in `app/controllers/`.
* Look in those directories...
    * `app/views/layouts/`
    * `app/views/layouts/application.html.erb`
    * `app/controllers/application_controller.rb`
* Let's see it in action...


!SLIDE bullets
# `rails server`

* Go back to `train_maker`.
* Run...

    ```bash
    $ rails server
    ```
* Go to http://localhost:3000.
* Realize you haven't done any coding yet...


!SLIDE incremental bullets
# `rails server` (cont.)

* Let's create a resource...

    ```bash
    $ rails generate scaffold TrainCar name:string car_class:string car_number:integer
    ```
    * Look at the files that were created...
* Restart Rails...
* Look at how that changed the app...
    * (refresh your browser)
* Let's fix that...

    ```bash
    $ rake db:migrate
    ```
* Go to http://localhost:3000/train_cars.


!SLIDE bullets incremental
# How'd it do that?

* Check the help...

    ```bash
    $ rails generate scaffold --help
    ```
    * Read the `Description`.
* Look at what was generated:
    * the model: `app/models/train_car.rb`
    * the controller: `app/controllers/train_cars_controller.rb`
    * the views: `app/views/train_cars/`


!SLIDE bullets incremental
# But there were more files...

* Look at `config/routes.rb`:
    * `resources :train_cars` = shortcut for defining:
        * index: `GET train_cars`
        * show: `GET train_cars/:id`
        * new: `GET train_cars/new`
        * create: `POST train_cars`
        * edit: `GET train_cars/:id/edit`
        * update: `PATCH train_cars/:id`
        * destroy: `DELETE train_cars/:id`


!SLIDE smbullets incremental
# But there were more files... (cont.)

* Look at `db/migrate/*_create_train_cars.rb`...
* Look at `db/schema.rb`...
* Look at `test/models/train_car_test.rb`...
* Look at `test/controllers/train_cars_controller_test.rb`...
* Run the tests!

    ```bash
    $ rake test
    ```
* Look at `app/views/train_cars/index.json.jbuilder`...
* Look at `app/assets/javascripts/train_cars.js.coffee`...
* Look at `app/assets/stylesheets/train_cars.css.scss`
* Look at `app/assets/stylesheets/scaffolds.css.scss`...


!SLIDE bullets incremental
# Rail & MVC Wrap-Up

* Most code revolves around models, controllers, and views.
* Others are Rails bells-and-whistles to make things easier:
    * CLI generators.
    * Database migrations.
    * Tests.
    * Rake tasks.
    * JSON serializers.
    * JavaScript (as CoffeeScript).
    * CSS (as Sass).
* Rails decides where to put files and how to name them.
    * Possible to deviate, but try to avoid.


!SLIDE center questions
# Questions?
