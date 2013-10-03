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
    * Version 3 should be released soon.
* Also: [vlad](http://rubyhitsquad.com/Vlad_the_Deployer.html)
    * Strives to be thin/simple.
    * Uses Rake for tasks.


!SLIDE bullets
# Deploying (cont.)

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
* You're welcome to do manually...
* but Configuration Management is en vogue:
    * [chef](http://www.opscode.com/chef/)
    * [puppet](https://puppetlabs.com)
    * [ansible](http://www.ansibleworks.com)
* CM lets you check in code that defines your environment.
    * Your environment lives with your code.


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

    $ git branch heroku
    $ git checkout heroku
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
    $ git push heroku heroku:master
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
* Git it!

    ```bash
    $ git branch add_vagrant
    $ git checkout add_vagrant
    ```



!SLIDE bullets
# Flockr -> Vagrant VM (cont.)
* Download & install [Vagrant](http://downloads.vagrantup.com)
* Init Flockr to use a precise64 base box:

    ```bash
    $ vagrant init precise64 http://files.vagrantup.com/precise64.box
    ```
    * (substitute 32 for 64 if you must)
* Look at the new `Vagrantfile`...
    * [Mine](https://github.com/turboladen/flockr/blob/89e07f0258282c60aaf871f9b1b3e370e5ce79b1/Vagrantfile)
* Add `Vagrantfile` to git...
* Boot the box!

    ```bash
    $ vagrant up
    ```


!SLIDE bullets
# Flockr -> Vagrant VM (cont.)

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
# OS Dependencies

* We need:
    * Ruby
    * Web server
    * App server
    * Database
    * User + SSH access to run the app as?
* Eventually, do this on all boxes that will run the app:
    * staging
    * production
    * etc?
* Sure would be nice to not have to manually do this twice...


!SLIDE bullets
# Installing Ruby

* Yeah, we've done this before...
* You may run into permissions problems with RVM or rbenv.
    * If RVM, install RVM (etc) using "system-wide" option.
        * Necessary for getting Ruby access for more than 1 user.
        * Can lead to sudo & permissions hell.
    * RVM lets you use `rvmsudo` instead of `sudo`...
    * I'm liking [chruby](https://github.com/postmodern/chruby) for production.


!SLIDE bullets
# Install Minor Depedencies

* We need bundler already on the box:

    ```bash
    $ gem install bundler
    ```
* We need OS dependencies:
    * git
    * imagemagick/libmagick-dev/graphicksmagick/whatever
    * A JS runtime...
    * A user, `deploy`, for deploying the app.
    * SSH for [Deploying with Capistrano](https://help.github.com/articles/deploying-with-capistrano).


!SLIDE smbullets
# Installing nginx + Passenger

* [Instructions](https://www.phusionpassenger.com/download)...
* Install the `passenger` gem.
* I want nginx + passenger, so

    ```bash
    $ sudo passenger-install-nginx-module
    ```
    * (install any missing dependencies that passenger tells you about)
    * (`rvmsudo` if using RVM)
* Edit `nginx.conf` to point to where flockr will reside:

    ```
    server {
        listen 80;
        server_name localhost;
        root /opt/nginx/html/flockr/public;   # <--- be sure to point to 'public'!
        passenger_enabled on;
    }
    ```

!SLIDE bullets
# Installing nginx + Passenger (cont.)

* We need to create the `flockr` directory and set permissions.

    ```bash
    $ sudo mkdir /opt/nginx/html/flockr
    $ sudo chown deploy /opt/nginx/html/flockr
    ```
* Add the [nginx init script](http://wiki.nginx.org/Nginx-init-ubuntu)
    * (edit paths to match your install)
* Start nginx:

    ```bash
    $ sudo /etc/init.d/nginx start
    ```


!SLIDE bullets
# Installing Postgres

* Easiest (?): use the server's package manager.
    * You'll need `libpq-dev` on Ubuntu; something similar on other distros.
* Set the `postgres` user's password:

    ```
    $ sudo -u postgres psql postgres
    postgres=# \password postgres
    ```
* Create the `deploy` database user:

    ```
    $ sudo su postgres -c psql
    postgres=# CREATE ROLE deploy SUPERUSER LOGIN;
    postgres=# \q
    ```
    * (probably don't want it as a superuser...)

!SLIDE bullets
# Installing Postgres (cont.)

* Update flockr to use Postgres:
    * [Gemfile](https://github.com/turboladen/flockr/blob/543e0d618e9f375c41b25d7126ea166c0fcee778/Gemfile)
    * [config/database.yml](https://github.com/turboladen/flockr/blob/f14682532771daed5d7fb7f3830831db10fd0ee1/config/database.yml)

!SLIDE bullets
# Now the deploy part.

* I put these changes in a separate branch for you...

    ```bash
    $ git checkout master
    $ git branch add_capistrano
    $ git checkout add_capistrano
    ```

!SLIDE bullets
# Capistrano Setup

* Add `capistrano` to the project (uncomment in `Gemfile` & `bundle`).
* Add capistrano files to the project:

    * [Changes](https://github.com/turboladen/flockr/commit/2ab6f5b75184d26236956dc187e7a4a765c25891)
* Create initial directory structure:

    ```bash
    $ cap staging deploy:setup
    ```
* Do a "cold" deploy:

    ```bash
    $ cap staging deploy:cold
    ```
    * (does everything but restart your app server)

!SLIDE bullets
# Capistrano Setup (cont.)

* Create the database (remotely):

    ```bash
    $ cd /opt/nginx/html/flockr/current
    $ bundle exec rake db:create RAILS_ENV=production
    ```
* Now, really deploy:

    ```bash
    $ cap staging deploy
    ```
* And try it out: http://192.168.33.10


!SLIDE bullets
# More on Capistrano

* Mess up your release?  Roll back!

    ```bash
    $ cap staging deploy:rollback
    ```
* It'll amass releases in `../flockr/releases`, so clean up:

    ```bash
    $ cap staging deploy:cleanup
    ```
* Once `staging` is all good, move on to `production`...


!SLIDE
# Deploy Summary

* Kinda painful, right?
* Heroku handled all of that mess for us.  $$$
* But Configuration Management can make this a lot easier.
    * (chef, puppet, ansible, etc.)
* What if your server goes down?  How to recreate?


