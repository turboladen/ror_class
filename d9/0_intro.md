!SLIDE center just-title
# Geekwise: Ruby on Rails

## Day 9/12: Finishing Flockr


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
