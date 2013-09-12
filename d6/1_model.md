!SLIDES title
# Our Models


!SLIDES incremental
# WAAAAIT!  What about our database???

* Check out `config/database.yml`...


!SLIDES incremental
# Why start with the model?

* Actually, may want to start with the route...
* It's the data that our users are trying to see!
* After defining the data, move on to getting access to it.
    * (the controller)


!SLIDES bullets
# Get Git Ready

* Let's branch for the changes we'll make today.

    ```bash
    $ git branch day6
    $ git checkout day6
    ```


!SLIDES incremental
# How about Users?

* We have photos, but they need a user to associate with first.
* What are the attributes of our User?
* email vs username?
* password vs oauth?
* name, first name, last name?
* Let's generate some scaffolding...

    ```bash
    $ rails generate scaffold User email:string
    ```
* Now add those files to your git repo and commit them...

    ```bash
    $ git add .
    $ git commit -m "Initial User scaffolding."
    ```


!SLIDES incremental
# Our First "Validation"

* What's a validation?

     > Validations are used to ensure that only valid data is saved into
     > your database.

     source: ["Active Record Validatons"](http://edgeguides.rubyonrails.org/active_record_validations.html)
* `User`s must have an email address, so... let's test first!
    * Add [spec/models/user_spec.rb](https://github.com/turboladen/ror_class/blob/d09c5120e25b61e4fa006c48af79fb728ca35782/flockr/spec/models/user_spec.rb).
    * Then run:

    ```bash
    $ rake spec
    ```


!SLIDES incremental
# Our First "Validation" (cont.)

* Let's check that out first...

    ```bash
    $ rails console
    ```
    ```ruby
    > u = User.new
    > u.valid?
    > u.persisted?
    > u.save
    > u.errors
    > u.errors.any?
    ```


!SLIDES incremental
# Our First "Validation" (cont.)

* Now for the validation...
    * [app/models/user.rb](https://github.com/turboladen/ror_class/blob/c83fdf5fc86245e6c3a4b13097ce0b28b335f8d4/flockr/app/models/user.rb)
* Rerun the specs...
* Let's check that out now...

    ```bash
    $ rails console
    ```
    ```ruby
    > u = User.new
    > u.valid?
    > u.save
    > u.errors
    > u.errors.any?
    > u.errors[:email]
    > u.email = 'me@stuff.com'
    > u.valid?
    > u.save
    ```


!SLIDES bullets
# Git it!

* Add newly created files to the repo.
* Commit the files, saying "Added first validation."


!SLIDES incremental
# Our First "Validation" (cont.)

* Back to the specs: Should we remove one of those?
* I'd go with the `errors` one.
* More on [rspec-rails](https://www.relishapp.com/rspec/rspec-rails/v/2-14/docs/model-specs/errors-on).
* What else could we validate?
* How about uniqueness of the email?
    * Can you add?
        * Hint: `uniqueness:`...
    * Add specs...
    * Check out in `rails console`...


!SLIDES bullets
# Git it!

* Commit the files, saying "Added validation on email uniqueness."


!SLIDES incremental bullets
# Our `User` needs some `Photo`

* Let's "associate" them!
    * This is how we relate tables in our RDBMS.
* Test first...
    * [spec/models/user_spec.rb](https://github.com/turboladen/ror_class/blob/29489a541568ac503589b7469a7e72fea50e276d/flockr/spec/models/user_spec.rb)
    * Run it...
* Now update `User`...
    * [app/models/user.rb](https://github.com/turboladen/ror_class/blob/750b135f9d12a100c21743e20ef447c63a4405a3/flockr/app/models/user.rb)
    * Run specs...


!SLIDES incremental bullets
# Our `User` needs some `Photo` (cont.)

* Now check it in `rails console`...

    ```ruby
    > photo = Photo.new
    > user = User.new(email: 'guy@smiley.com')
    > user.photos << photo
    > user.save
    ```
* Fix our test!
    * [spec/models/user_spec.rb](https://github.com/turboladen/ror_class/commit/2a434e2386965d2d358a2d694da6dd9351a98da4)


!SLIDES incremental bullets
# Our `Photo` needs some `User` too

* The `belongs_to` association makes that model store the foreign key for the
  model that `has_many`.

----
* Add the spec to `Photo` that says it belongs to a `User`...
    * [spec/models/photo_spec.rb](https://github.com/turboladen/ror_class/commit/1af23c5657d7d084b9673c0a0da952e14d7bfde5)
    * Run it...
* Add the `belongs_to` association...
    * [app/models/photo.rb](https://github.com/turboladen/ror_class/commit/d0c3e322c742b782306d609e0ff4bab19d06ad9b)
    * Run specs...
* We didn't define the foreign key when we created `Photo`!
* How to add?


!SLIDES incremental
# Migration time!

* Use a generator to create.

    ```bash
    $ rails generate migration AddUserRefToPhotos user:belongs_to
    ```
* Check out the new migration.
* Apply the migration.
* Run specs.


!SLIDES incremental
# Let's try that again...

* We've been working on associating `User` and `Photo`...
* Try it out in `rails console`.

    ```ruby
    > p = Photo.new
    > u = User.new(email: 'a_new_email@address.com')
    > u.photos << p
    > u.save
    > p = Photo.last
    > p.user
    ```
* All hooked up!
* Just one more thing...
    * What if the user's account is deleted?
    * What to do with its photos?


!SLIDES bullets
# Git it!

* Add the newly created files to the repo.
* Commit the files, saying "Associated user and photo."


!SLIDES incremental bullets
# `dependent: :destroy`

* \^\^\^That's all we have to add to our `has_many`.
* Add spec...
    * [spec/models/user_spec.rb](https://github.com/turboladen/ror_class/commit/2e560bb4d10a0a9da96d255ff972320f1d0bf44b)
    * Run it...
* Update the model...
    * [app/models/user.rb](https://github.com/turboladen/ror_class/commit/8884e488c3f083bf06f13e593dac7e345bfedd92)
    * Run specs...
* Try it out in `rails console`.

    ```ruby
    > p = Photo.new
    > u = User.create(email: 'a_new_email@address.com', photos: [p])
    > p = Photo.last
    > u.destroy
    > p.reload          # p doesn't know it's been updated
    ```


!SLIDES bullets
# Git it!

* Commit the file, saying "Destroy dependent photos."


!SLIDES
# Notes and Model Recap

* Models let us access our data in an object-oriented nature.
* Validations and Associations are business logic, defined on models.
* You're responsible for adding foreign keys.
* `save` vs. `create`
* `save` vs. `save!`


!SLIDES questions center
# Questions?


!SLIDES bullets
# Git it!

* Push the branch up.

    ```bash
    $ git push -u origin day6
    ```

