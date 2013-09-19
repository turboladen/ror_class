!SLIDE title
# Geekwise: Ruby on Rails

## Day 7/12: Authentication, Part 1


!SLIDE questions center

```ruby
questions.any? { |q| q.created_at > Time.yesterday }
```

### (any questions since last time?)


!SLIDE
# Today's Goals

1. Learn about Rails' authentication abilities.
+ Learn more about models.
+ Learn how to make custom routes.
+ Learn about views, layouts, and partial views.
+ Learn how forms are made easy with Rails.
+ Learn how Rails controllers use strong parameters to only let good data in.


!SLIDE
# Overview for Today

* Authenticating `User`s (i.e. the model objects).
* Updating controller & views to allow sign-up.


!SLIDE
# Itinerary Changes!

* Slimmed down Flockr requirements.
* Days 7, 8, 9 are all focused on Flockr features.
* Day 10 focuses on deep-diving into components of Rails.
* Day 11 now includes Deployment.
* Removed:
    * Other ORMs & Database types.
    * Emailing & ActionMailer.
    * JS, AJAX.


!SLIDE incremental
# Review of Day 6

* Created a new `day6` branch in git for our changes.
* Added `User` and `Photo` models.
* Added `UsersController` and `PhotoController`.
* Made `:photos` a nested resource under `:users` in our `routes.rb`.
* Spent a lot of time refactoring.
* Requirements implemented:
    * Users can view photos at `/users/:user_id/photos`.


!SLIDE bullets
# Merge `day6` to `master`

* Get all of the changes on github:

    ```bash
    $ git checkout master
    $ git pull
    ```
* Merge in the branch:

    ```bash
    $ git merge day6
    ```
* Commit all that stuff to `master`:

    ```bash
    $ git commit
    ```
* Push to github...


!SLIDE bullets
# Clean up branches

* If you want, delete local and remote branches:

    ```bash
    $ git branch -d day6
    $ git push origin :day6
    ```

!SLIDE questions center
# Questions?
