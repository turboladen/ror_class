!SLIDE title
# Flockr: Adding Photos
## (Better)


!SLIDE incremental bullets
# What?  How?

* Well, we need to...
    * Upload photos
    * Convert photo sizes
    * Version photos
* What if we decide we want to store photos differently?
* [carrierwave](https://github.com/carrierwaveuploader/carrierwave) does this
  for us!
* [RailsCast #253](http://railscasts.com/episodes/253-carrierwave-file-uploads)


!SLIDE
# I'm gonna try this live...

* Create and switch to a new git branch first!
    * Make sure to merge in `add_authentication`!
* Go do work...
* Commit and push the branch.


!SLIDE questions center
# Well, how was that?


!SLIDE bullets
# Flockr Requirements Status!

* Done:
    * Users must authenticate.
    * Users can view photos at `/users/:user_id/photos`.
    * Users can upload photos.
    * Users can convert photo sizes.
    * Users can version photos.
* Not done:
    * Users can comment on photos.
    * Users can share photos.
    * Photos are paginated.
