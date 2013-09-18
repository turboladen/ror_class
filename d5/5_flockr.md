!SLIDE title
# Our Project


!SLIDE bullets
# What are we building?

* "Flockr", the Flickr clone.
    * Repo: https://github.com/turboladen/flockr
* Requirements:
    * Users must authenticate.
    * Users can view photos at `/users/:user_id/photos`.
    * Users can upload photos.
    * Users can favorite photos.
    * Users can comment on photos.
    * Users can create sets of photos.
    * Users can share photos.
    * Users can add contacts/friends.
    * Users can convert photo sizes.


!SLIDE bullets
# What are we building? (cont.)

* Requirements (cont.):
    * Photos are paginated.
    * Photos are versioned.
* Don't hesitate adding anything that you think of.
    * i.e. play as you read & learn more.
* Extra credit:
    * Users can view photos at: `/photos/:user_name`.


!SLIDE bullets incremental
# Let's dig in.

* Create your app.
* Now delete that directory.
* Now do:

    ```bash
    $ rails new flockr --skip-test-unit
    ```
* I want to use RSpec...


!SLIDE bullets
# Install rspec-rails

* Check out the [rspec-rails](https://github.com/rspec/rspec-rails) project page.
* Install it.


!SLIDE bullets
# Bundler

* What is it?

    > Bundler maintains a consistent environment for ruby applications. It
    > tracks an application's code and the rubygems it needs to run, so that an
    > application will always have the exact gems (and versions) that it needs
    > to run.
* http://bundler.io
* Get familiar with Ruby's [pessimistic operator](http://robots.thoughtbot.com/post/2508037841/rubys-pessimistic-operator).


!SLIDE incremental bullets
# photos

* What attributes should a photo have?
* file name?
* path to image file?
* anything else?
* Let's not get ahead of ourselves...
* Create scaffolding for photos.
* ... like this:

    ```bash
    $ rails generate scaffold photo file_name:string path:string
    ```

!SLIDE incremental bullets
# photos (cont.)

* Run the specs...

    ```bash
    $ rake spec
    ```
* Migrations!?
    * Check out `db/migrate/*_create_photos.rb`
    * Well, run them...

        ```bash
        $ rake db:migrate
        ```
    * Then check out `db/schema.rb`
* Re-run the specs.


!SLIDE incremental bullets
# photos (cont.)

* Check it out...
    * `rails server`
    * http://localhost:3000/photos


!SLIDE bullets
# Wrap Up

* We just did a lot. ...but didn't have to do much, really.


!SLIDE questions center
# Questions?
