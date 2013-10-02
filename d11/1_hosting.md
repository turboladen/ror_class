!SLIDE title
# Getting to Production


!SLIDE
# Decisions, Decisions...

* What box/HW/OS to run on?
* How much horsepower do I need?
* Who will host?
* What web server?
* What app server?
* How to get the code onto the server?
* How to get dependencies onto the server?


!SLIDE bullets
# Operating System & System Resources

* OS
    * Most hosting will offer some Linux distribution.
    * Some offer Windows.
    * Linux is probably your best bet.
* RAM
    * Get as much RAM as you can afford.
* Disk Storage
    * What are you saving?
* CPUs
    * Should scale as your app gets more popular.


!SLIDE bullets
# Hosting

* Popular big fish:
    * [AWS](http://aws.amazon.com)
    * [Heroku](https://www.heroku.com)
    * [Engine Yard](https://www.engineyard.com)
* A little more reasonable:
    * [Rackspace](http://www.rackspace.com)
    * [Digital Ocean](https://www.digitalocean.com)
    * [Linode](https://www.linode.com)
    * [OpenShift](https://www.openshift.com/developers/ruby)
* Interesting:
    * [Nitrous.IO](https://www.nitrous.io)


!SLIDE bullets
# Hosting (cont.)

Ok, great, but what do I _need_?

* Very basic:
    * Ruby >= 1.9.3 installed.
    * Ability to install and run gems.
    * Ability to run some web server (Apache, nginx, lighttpd, etc).
    * Ability to use OS 3rd party libraries (i.e. imagemagick).
* Nicer:
    * Ability to install Ruby versions.
    * Ability to install OS 3rd party libraries.
    * ssh access.
    * Ability to configure OS library config files.
* Nicest:
    * Full OS access.

What can you afford?


!SLIDE bullets
# Web Servers

* Which web server?
    * Apache:
        * Released in 1995.
        * Lots of info available.
        * Runs anywhere.
    * Nginx:
        * Released in 2002.
        * Aims to be slim and fast.
        * Unix socket support.
    * IIS:
        * Windows-only.
        * Sounds painful.
    * JBoss:
        * Java + JRuby!
        * http://torquebox.org


!SLIDE bullets
# App Servers

* Remember [Web Servers, App Servers, and the Web](d4#76)?
* And [Rack, Rails, & the Web](d5#11)?
    * (check [this pic](d5#14))
* Concurrency is the problem, solved in different ways!
    * Thread pools?  Process pools?
* Which app server?
    * Depends on what your app is for.
* What does your app do?
    * Lots of short/little requests?
    * Lots of long/big requests?
    * Do requests delegate to other processes/servers?


!SLIDE bullets
# App Servers: Phusion Passenger

* [Phusion Passenger](https://www.phusionpassenger.com)
    * Defaults to nginx, but can use Apache.
    * Almost no config required.
    * Came from "mod_ruby" on Apache.
    * Multi-threaded & multi-process.
    * "Hybrid" evented.
    * Can take a _long_ time to compile.
        * (updating can be painful)


!SLIDE bullets
# App Servers: Unicorn

* [Unicorn](https://github.com/blog/517-unicorn)
    * Requires nginx (for the Unix socket).
    * nginx proxies all requests to the shared Unix socket, which forward to
      unicorn master process.
    * Takes some tweaking to get it configured right.
    * 0-down-time deploys.
    * Created by GitHub peeps.
    * Bad for slow clients with large payloads.


!SLIDE bullets
# App Servers: Thin

* [Thin](http://code.macournoyer.com/thin/)
    * Works with any web server.
    * Tell web server to proxy requests to thin processes, running on different
      TCP ports.
    * Internally evented.
    * Uses tools that have been around the block.
    * Easy to use for development or production.
    * Good for slow clients with large payloads.


!SLIDE bullets
# App Servers: Puma

* [Puma](http://puma.io)
    * Built for speed, concurrency, and small footprint.
    * New(er) kid on the block; lots of positive reports.
    * Better on Rubinius or JRuby?


!SLIDE bullets
# It all depends...

* Your web host, web server, and app server should be determined by your app's
  needs.
* If your app doesn't need a lot, use what _feels_ best to you.
    * Which is easiest to set up?
    * Which is easiest to understand?
    * Which looks prettiest?
    * Which has the purpose that you most agree with?
* If you still don't care, use Passenger.
    * (but just for the production environment)


!SLIDE questions center
# Questions?
