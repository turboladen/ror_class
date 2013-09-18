!SLIDE title
# Geekwise: Ruby on Rails

## Day 7/12

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
