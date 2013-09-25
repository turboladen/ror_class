!SLIDE title
# Flockr: Paginating Photos


!SLIDE
# Get git ready

* Make sure you're up to date...

    ```bash
    $ git checkout master
    $ git pull
    ```
* Merge in changes from `photo_comments`?

    ```bash
    $ git merge photo_comments
    ```
* Create a branch:

    ```bash
    $ git branch pagination
    $ git checkout pagination
    ```


!SLIDE
# How to add?

* Rolling our own wouldn't be too bad...
    * Controller accepts a `:page` param.
    * Model defines a `page` scope/method that returns the number of items for
      the page.
* Let's use someone else's code.
    * [kaminari](https://github.com/amatsuda/kaminari)
        * [RailsCast #254](http://railscasts.com/episodes/254-pagination-with-kaminari)
    * [kaminari-bootstrap](https://github.com/mcasimir/kaminari-bootstrap)

!SLIDE
# Setup

* Add the latter to the `Gemfile` and `bundle install`.
    * Need to use the version from github!
    * [Changes](https://github.com/turboladen/flockr/commit/c42440ad795571df73000713c41306bdf447b10f)
* Generate kaminari's config/initializer:

    ```bash
    $ rails g kaminari:config
    ```
* Set the `config.default_per_page` to 8:
    * [Changes](https://github.com/turboladen/flockr/commit/5104b724396ad32752b09c597777d2777829737e)


!SLIDE
# Controller & View

* We want anyone's `Photo`s, but only enough for 1 page's worth.
    * [Changes](https://github.com/turboladen/flockr/commit/2e914fffbbd7b7f2719642c0bbb84f4a036909c8)
* Display the pics in 2 rows of 4.
    * [Changes](https://github.com/turboladen/flockr/commit/1ad5cceac8336538d016f41c8ee1d2cf458b0919)


!SLIDE
# Git it!

* Commit

    ```bash
    $ git commit -a
    ```
* Push

    ```
    $ git push -u origin pagination
    ```

!SLIDE questions center
# Questions?
