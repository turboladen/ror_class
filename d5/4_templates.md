!SLIDE title
# Templating


!SLIDE incremental bullets
# What's it for?

* Defining our views.
* Think: _once Rails gets our `TrainCar` from the DB, how does it display it?_
* Open `app/views/train_cars/index.html.erb`...
    * ...and compare to http://localhost:3000/train_cars
* Thus, can dynamically generate HTML for the resource representation.


!SLIDE bullets
# In Brief: HTML

* ERB
    * default for Rails
    * Looks like HTML
* HAML

    ```haml
    %p#notice= notice
    %p
      %strong Name:
      = @train_car.name
    %p
      %strong Car class:
      = @train_car.car_class
    %p
      %strong Car number:
      = @train_car.car_number
    = link_to 'Edit', edit_train_car_path(@train_car)
    |
    \#{link_to 'Back', train_cars_path}
    ```

!SLIDE bullets
# Templating Summary

* We'll do ERB, so you'll pick it up as we go.


!SLIDE questions center
# Questions?
