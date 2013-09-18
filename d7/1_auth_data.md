!SLIDE title
# New Feature: Authentication


!SLIDE
# The `devise` Gem

* https://github.com/plataformatec/devise
* Super great.
* Lots of features.
* We'll roll our own.
    * http://ruby.railstutorial.org/chapters/modeling-users#top


!SLIDE incremental bullets
# Uniqueness Gotchas

* `email` and `username` haven `uniqueness` constraints...
* Remember `User.new` vs `User.save`?
* Validations are run _before_ committing to the DB--i.e. in memory!
* Thus, it's possible to end up with 2 requests for the same attribute
  that pass the validation.
* How to fix?
    * Let the database validate too:
        * Create a unique index for the unique attribute.
    * Ensure attribute values are lower-case before saving.
        * (Not always a solution)


!SLIDE bullets
# Add Indexes for `email` and `username`

* Create and checkout a git branch, `add_authentication`.
* Add a migration to add the index for email:

    ```bash
    $ rails g migration add_index_to_users_email
    ```
* Edit the migration:

    ```ruby
    def change
      add_index :users, :email, unique: true
    end
    ```
* Do the same for `username`.


!SLIDE bullets
# Lowercase `email` and `username`

* Rails provides callbacks or hooks.
    * Code that gets executed in the workflow of committing a record to DB.
* Add a `before_save` hook to convert before saving.
    * [app/models/user.rb](https://github.com/turboladen/flockr/blob/eb96fd7defb10d855522dfa4d53575a3a78086bc/app/models/user.rb)

Now uniqueness is really enforced!

* Try it out in the Rails console...

    ```bash
    $ rails console --sandbox
    ```


!SLIDE incremental bullets
# Add Specs

* What tests to add/not to add?
    * `create`ing when uppercase `email` gets saved as lowercase.
    * `create`ing when uppercase `username` gets saved as lowercase.
* Add them:
    * [spec/models/user_spec.rb](https://github.com/turboladen/flockr/commit/eb96fd7defb10d855522dfa4d53575a3a78086bc)
    * Out of time? Get the specs:

        ```bash
        $ git cherry-pick eb96fd7defb10d855522dfa4d53575a3a78086bc
        ```


!SLIDE incremental bullets
# Add Specs (cont.)

* Run them:

    ```bash
    $ rake db:migrate
    $ rake test:prepare
    $ rake spec
    ```
* Git it!


!SLIDE incremental bullets
# Add Encrypted Password

* We'll...
    * use Rails' `has_secure_password` to define "virtual attributes".
    * add a `password_digest` column to `User` to store it.
    * use [bcrypt](http://en.wikipedia.org/wiki/Bcrypt).

* Add the `bcrypt-ruby` dependency to `Gemfile`:
    * Edit the `Gemfile`.
    * `bundle install`
* Add `has_secure_password` to `app/models/user.rb`.
* Create a migration to add the `password_digest` column:

    ```bash
    $ rails g migration add_password_digest_to_users password_digest:string
    ```


!SLIDE incremental bullets
# Add Specs

* What to add?
    * Since `has_secure_password` adds `#password` and `#password_confirmation` to `User`...
        * Confirm that, using `it { should respond_to ... }`
    * Validation fails if `password` and `password_confirmation` are empty.
    * Validation fails if `password` and `password_confirmation` don't match.
* Let's see here:
    * [685d8dd765bf0b7f52b43d90d31c8b6ccb026bfc](https://github.com/turboladen/flockr/commit/685d8dd765bf0b7f52b43d90d31c8b6ccb026bfc)
* Git it!


!SLIDE incremental bullets
# Add `authenticate` Method

* Actually, `has_secure_password` adds for us, so let's add specs.
    * [spec/models/user_spec.rb](https://github.com/turboladen/flockr/commit/dd6e34987a777ad481be33e4ae32649b6ad5a7ad)
* Run them.
* Check it out in `rails console`.

    ```ruby
    > user = User.create email: 'test@test.com', username: 'person', password: 'password', password_confirmation: 'password'
    > user.authenticate 'meow'
    > user.authenticate 'password'
    ```
* Git it!


!SLIDE
# Recap so far

* Added `password_digest` to the model.
* Used Rails' `has_secure_password` to add virtual attributes.
    * `password`
    * `password_confirmation`
* Used `rails console` to see how `#authenticate` works.
* We're set up now to update our controllers & views to use our new `User`.

