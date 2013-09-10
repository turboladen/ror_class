!SLIDE title
# Web Servers, App Servers, and the Web


!SLIDE bullets
# Web Servers, whaaaat?

* Chronology of running Ruby, server-side:
    * CGI
    * Apache + FastCGI
    * HTTP proxy + cluster of Ruby servers (Mongrel)
        * ([mongrel](http://en.wikipedia.org/wiki/Mongrel_(web_server)) = first web server used by Twitter)
    * HTTP proxy -> Unix socket -> Ruby servers
* Why Ruby web servers?
    * Something needs to convert to Ruby/Rack.
    * Allows other servers to sit in front:
        * Proxy, load balancer, both, etc.


!SLIDE bullets
# Web Servers, whaaaat? (cont.)

* Wait, you said servers (plural), right?
    * Yup.
    * Ruby isn’t multi-core aware.
    * Need multiple Ruby processes to handle concurrent connections.
    * ...different Ruby web servers have different strategies for scaling.
* Some popular web servers:
    * Phusion’s Passenger
    * Unicorn (from GitHub)
    * Thin
    * Puma
    * Each solve the problem slightly differently.


!SLIDE bullets incremental
# (Simple) Request Lifecycle

1. Client sends request to http://ourserver.com.
+ App server (i.e. Apache) receives request.
+ App server forwards on to an available Ruby web server process.
+ Web server might do some parsing, then hands to Rack.
+ Rack parses and hands to destination route/resource.
+ Rack destination route hands to middleware (including web framework).

Responding is more or less the reverse.


!SLIDE bullets
# Why is this important?

* You need to know what type of clients your site is servicing.
    * Long requests?
    * Are they able to wait?
* What if their request makes your app do a bunch of work?
* What if you get so many clients that they start having to wait?
* App server set up!
* What stack you choose can effect your downtime when updating.


!SLIDE questions center
# Questions?


