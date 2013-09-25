!SLIDE title
# Flockr: Photo Comments


!SLIDE
# Requirements

* List all comments for a photo on the photo's `show` page.
* Allow any user to comment on a photo.
* Allow commenting user to edit and delete their comment.
* Comments belong to:
    * the commenting user.
    * the photo being commented on.
* Comments are deleted when the photo is deleted.
* Comments are _not_ deleted when the commenting user is deleted.

!SLIDE
# Get git ready

* Make sure you're up to date...

    ```bash
    $ git checkout master
    $ git pull
    ```
* Create a branch

    ```bash
    $ git branch photo_comments
    $ git checkout photo_comments
    ```

!SLIDE bullets incremental
# Start with the DB

* Create the model:

    ```bash
    $ rails g model Comment body:string user:references photo:references
    ```
* Make sure comments have content and their associated fields.
    * Edit `app/models/comment.rb`:

        ```ruby
        validates_presence_of :body, :user, :photo
        ```

!SLIDE bullets incremental
# Start with the DB (cont.)

* Add the inverse assocations:
    * Edit `app/models/user.rb`:

        ```ruby
        has_many :comments
        ```
    * Edit `app/models/photo.rb`:

        ```ruby
        has_many :comments, dependent: :destroy
        ```
* Add model tests.


!SLIDE
# Fixtures!

* [_Fixtures_](http://guides.rubyonrails.org/testing.html#the-low-down-on-fixtures) = sample DB data.
* Refactor for fixtures:
    * [Changes](https://github.com/turboladen/flockr/commit/525b1fa3c29cf9298079db3ff237aa6bf67d9585)


!SLIDE bullets incremental
# On to the Controller

* Now we want to be able to `GET` on `/users/:user_id/photos/:photo_id/comments/new`
    * ...and to `POST` to something similar...
    * ...but to view comments, they should be on `/users/:user_id/photos/:photo_id`
* CommentsController!

    ```bash
    rails g controller comments new create destroy edit
    ```


!SLIDE bullets incremental
# On to the Controller (cont.)

* Fix routes...

    ```ruby
    resources :users do
      resources :photos do
        resources :comments, only: %i[new create edit destroy]
      end
    end
    ```
* Delete unused files:
    * `app/views/comments/destroy.html.erb`
    * `app/views/comments/create.html.erb`
    * `spec/views/comments/destroy.html.erb_spec.rb`
    * `spec/views/comments/create.html.erb_spec.rb`


!SLIDE bullets incremental
# Controller & Views: new/create

* Add controller code for new/create.
    * [Changes](https://github.com/turboladen/flockr/commit/fc185725d26f942be79f39417f0c5b1915b8e84f)
* Now to display comments on the photo...
    * Add `app/views/photos/show.html.erb` to show comments, link to new comment form.
        * [Changes](https://github.com/turboladen/flockr/commit/aba235dafa48f11d3cb560717294892ae28b0f68)
* Now we need the form to add photos...
    * Add `app/views/comments/new.html.erb`
    * Add `app/views/comments/_form.html.erb`
    * [Changes](https://github.com/turboladen/flockr/commit/8aaf102ba7ee2d903a6b70f5ac47d69e5b1393e2)


!SLIDE bullets incremental
# Controller & Views: edit/update

* Update `app/views/photos/show.html.erb` with edit link for each comment.
    * [Changes](https://github.com/turboladen/flockr/commit/e858c6b442dbc57d1831ab5ca04e05564b9a295b)
* Add `app/views/comments/edit.html.erb`
    * [Changes](https://github.com/turboladen/flockr/commit/ed19366d2c22bdc44286605ca46430bcec74ce0a)
* Fix routes and controller!
    * Forgot to generate with the `update` action!
    * [Changes](https://github.com/turboladen/flockr/commit/9c6a189db05b797ae440bef57ed504cb18ab1886)


!SLIDE bullets incremental
# Controller & Views: destroy

* Update `app/views/photos/show.html.erb` with delete link for each comment.
    * [Changes](https://github.com/turboladen/flockr/commit/a1ea5017f2d3844426d2a9d5153b48bfae4e3d69)
* Update `app/controllers/comments_controller.rb` with destroy.
    * [Changes](https://github.com/turboladen/flockr/commit/7c45ecb74ed0afa4ea264f247aef5adfd0894a0a)


!SLIDE bullets incremental
# Refactoring

`photo#show` is starting to get unwieldy.  Let's fix.

* Extract the code for showing each `comment` into a partial, `app/views/comments/_comment.html.erb`.
    * [Changes](https://github.com/turboladen/flockr/commit/52a7b442ebb935b0ec81cf2844d1d2d3805bb675)
    * If you use RubyMine, look under the `Refactor` menu...


!SLIDE bullets
# Git it!

* Commit:

    ```bash
    $ git commit -a
    ```
* Push:

    ```bash
    $ git push -u origin photo_comments
    ```

!SLIDE questions center
# Questions?
