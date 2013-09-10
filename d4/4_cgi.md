!SLIDE title
# CGI


!SLIDE bullets
# WAT?

* "Common Gateway Interface"
* Web server (Apache, etc) handles socket-y stuff, but executes Ruby scripts.
* Ruby library provides means for
    * parsing GET/POST params.
    * creating HTML forms.
    * dealing with cookies.
    * dealing with sessions.
    * (un/)escaping HTML.


!SLIDE bullets
# Bleh...

We're not going to talk about CGI, because...

* It's old.
    * Just kidding.  It's probably still used everywhere.
* Still leaves you doing many regular things manually or via the web server.
    * Response codes
    * Headers
    * Routing
* You could probably do a lot with it, but there's a more elegant way...
