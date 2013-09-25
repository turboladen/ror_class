!SLIDE center just-title
# Geekwise: Ruby on Rails

## Day 9/12: Finishing Flockr


!SLIDE questions center

```ruby
questions.any? { |q| q.created_at > Time.yesterday }
```

### (any questions since last time?)


!SLIDE
# Personal Project Progress

* Where are you on it?
* We'll have some time in class tomorrow.



!SLIDE
# Homework Review

* Flockr shows errors on failed login.
* Flockr feature specs.
* Fix SessionsController specs for Flockr.
* Extra credit: fix broken view specs.


!SLIDE
# Itinerary Updates!

* Removed:
    * Flockr: Sharing Photos
        * Check out [social-share-button](https://github.com/huacnlee/social-share-button)
    * Flockr: Versioning Photos
        * Check out [paper_trail](https://github.com/airblade/paper_trail)


!SLIDE
# Today's Goals

1. Review CarrierWave integration for uploading photos in Flockr.
+ Implement commenting on photos in Flockr.
+ Implement paginating photos on /home.
+ Review Flockr.


!SLIDE
# Carrierwave

* Any takers?  How was it?
* Here's my [carrierwave branch](https://github.com/turboladen/flockr/compare/carrierwave).
* Check out:
    * Moving of `app/views/photos/index.html.erb` to `app/views/photos/_index.html.erb`.
    * Use of `if current_user == @user` for conditionals in views.
* Realize that using carrierwave was just a matter of:
    * Adding to the `Gemfile` and `bundle install`ing.
    * Running its generator.
    * Configuring iit to tell it what to do with images.
    * Making DB changes to account for the images.
    * Displaying the images.



!SLIDE questions center

# Questions?
