!SLIDE title
# Sockets


!SLIDE bullets incremental
# WAT?

* _What's a Socket for?_
* Allows computers to talk to each other over a network.
* ...or processes, but not over a network.
* _Why do I care?_
* HTTP usually happens over TCP sockets.
* ...which means your Rails app must deal with sockets somehow.
* _But I'm using Rails so I don't have to know this stuff..._
* That's true, you don't if you only want to do the easy stuff...
* ...but it'll help otherwise.


!SLIDE bullets
# README

* Since Socket docs kinda suck...
    * [Programming Ruby's Socket Appendix](http://media.pragprog.com/titles/ruby3/app_socket.pdf)
      (as a PDF).
    * [Working with TCP Sockets](http://www.jstorimer.com/products/working-with-tcp-sockets),
      by Jesse Storimer.
* Since Ruby's `Socket` is just a wrapper around the C library, you can usually
  refer to your *nix docs.


!SLIDE bullets
# Socket Types

* Network based:
    * Datagram
        * connectionless
        * over UDP
    * Stream
        * connection-based
        * over TCP or SCTP
    * Raw
        * no transport layer

* Non-network based:
    * Unix
        * aka UDS (Unix Domain Socket)


!SLIDE bullets
# We'll only deal with TCP sockets.


!SLIDE bullets
# Let's try!

* I'll write a server, you write a client.
* Server:

    ```ruby
    require 'socket'

    server = TCPServer.new('0.0.0.0', 12345)

    while session = server.accept
      ip_address = session.peeraddr[3]
      request = session.recv(1450)
      STDOUT.puts "Request received from '#{ip_address}':"
      STDOUT.puts request

      session.print %Q[I'll show you, "#{request}!"]
      session.print "I know where you live: #{ip_address}"
      session.close
    end
    ```


!SLIDE bullets
# Let's try! (cont.)

* Client:

    ```ruby
    require 'socket'

    steves_ip = # Tell Steve to tell you his IP.
    socket = TCPSocket.new(steves_ip, 12345)
    socket.puts "Whatever you want to tell me"
    5.times { socket.gets }
    ```


!SLIDE bullets
# What's going on here?

* Server:
    * Creates a new TCP socket, listening on all interfaces on port 12345.
    * Waits for someone to connect.
    * Reads the request (1450 bytes), gets some info about the peer.
    * Creates a response and sends that back.
    * Closes the connection.
* Client:
    * Creates a new TCP socket, connecting to my IP address on port 12345.
    * Sends me whatever you send.
    * Gets the last 5 lines I sent you.


!SLIDE bullets
# Socket Summary

* This is exactly what's happening with HTTP.
    * Could've written Server to respond with:

        ```ruby
        session.puts "HTTP/1.1 200 OK\r"
        session.puts "Date: #{Time.now.httpdate}\r"
        session.puts "Server: Steve\n"
        session.puts "Content-Type: text/plain-text\r"
        # etc
        ```
* Problems though...
    * Server blocks while dealing with a client...
    * Would you want to build a web site on this?
