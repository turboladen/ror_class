!SLIDE title
# Deploying


!SLIDE bullets
# Deploying

* Means what?
    * Get your code onto your server.
    * Set up your environment.
* De facto: [capistrano](http://www.capistranorb.com)
    * [A Capistrano Rails Guide](https://gist.github.com/jrochkind/2161449)
    * Version 2 was current for ~5 years, until June 2013.
        * Most help you'll find now is for v2.
* Also: [vlad](http://rubyhitsquad.com/Vlad_the_Deployer.html)
    * Strives to be thin/simple.
    * Uses Rake for tasks.
* Both will/can:
    * SSH in to your server
    * Pull down your git repo
    * Set up your DB
    * Install bundler dependencies
    * Compile your assets
    * Etc.


!SLIDE bullets
# Deploying (cont.)

* What about your OS dependencies?
* You're welcome to do manually, but Configuration Management is en vogue:
    * [chef](http://www.opscode.com/chef/)
    * [puppet](https://puppetlabs.com)
    * [ansible](http://www.ansibleworks.com)
* CM lets you check in code that defines your environment.


!SLIDE bullets
# Deploying (cont.)

* All these tools--do I have to use them?
* Nope, but they can only help make your deployment life easier.


!SLIDE bullets
# Deploying Flockr

* Let's try deploying...
    * To heroku.
    * To a Vagrant-managed Virtual Box.


!SLIDE bullets
# Flockr -> Heroku

* [Getting Started with Rails 4.x on Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4)
* [Create a Heroku account](https://id.heroku.com/signup/devcenter).
* Download the [Heroku Toolbelt](https://toolbelt.heroku.com).
* Switch Flockr to use Postgres.

    ```bash

    $ git branch heroku_deploy
    $ git checkout heroku_deploy
    ```
    * [Changes]()
* Tell Heroku to create the app:

    ```bash
    $ heroku create
    ```

!SLIDE bullets
# Flockr -> Heroku (cont.)

* Let Heroku do deploy magic:

    ```bash
    $ git push heroku heroku_deploy:master
    ```
    * Notice `bundle install`...
    * Notice `Preparing app for Rails asset pipeline`...
* Set up the DB:

    ```bash
    $ heroku run rake db:migrate
    ```
* Try it out!
* Also look at https://dashboard.heroku.com/apps


!SLIDE bullets
# Flockr -> Vagrant VM

* [RailsCast #292](http://railscasts.com/episodes/292-virtual-machines-with-vagrant)
    * (uses old version of Vagrant)
* [Introduction to Vagrant for Rails developers](http://blog.dcxn.com/2013/07/12/introduction-to-vagrant-for-rails-developers/)
* Download & install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Download & install [Vagrant](http://downloads.vagrantup.com)
* Init Flockr to use a precise64 base box:

    ```bash
    $ vagrant init precise64 http://files.vagrantup.com/precise64.box
    ```
    * (substitute 32 for 64 if you must)


!SLIDE bullets
# Flockr -> Vagrant VM (cont.)

* Boot the box!

    ```bash
    $ vagrant up
    ```
* Look at the new `Vagrantfile`...
* Now SSH in to the box...

    ```bash
    $ vagrant ssh
    ```
* We've got a working VM!
* Screw something up?  Blow it away and start over!

    ```bash
    $ vagrant destroy
    $ vagrant up
    ```

!SLIDE bullets
# Now the deploy part.

* I put these changes in a separate branch for you...

    ```bash
    $ git checkout master
    $ git branch add_capistrano
    $ git checkout add_capistrano
    ```
* Add `capistrano` to the project (uncomment in `Gemfile`).
* Add capistrano files to the project:

    ```bash
    $ cap install
    ```
