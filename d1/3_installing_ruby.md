!SLIDE center just-title
# Installing Ruby

!SLIDE
# Installation Options

1. OS's distribution of Ruby (aka "system" Ruby)
+ Build from source
+ 3rd party installers:
    * *nix
        * [RVM](http://rvm.io) (Ruby Version Manager)
        * [rbenv](http://rbenv.org/)
        * [chruby](https://github.com/postmodern/chruby)
    * Windows
        * [RubyInstaller](http://rubyinstaller.org/)
        * [cygwin](http://www.cygwin.com)
        * [RailsInstaller](http://railsinstaller.org)

!SLIDE bullets
# System Ruby

* Pros
    * Use your OS's package manager.
    * Usually makes Ruby available to all users.
* Cons
    * Usually lags behind stable Ruby releases.
    * Path stuff can get convoluted.
    * Usually requires `sudo ...` unless you tweak.
    * *nix only (?).

!SLIDE bullets
# Build from source

* Pros:
    * No frills.  Just the goods.
    * Pretty easy as far as building from source goes.
* Cons:
    * Must manually install system dependencies.
    * May have to manually resolve PATH conflicts if system Ruby already exists/existed.
    * Have to manually download the source and run commands.
    * Updating to next version either means wiping out previous version or manually maintaining PATH.
    * Can require Visual Studio on Windows.

!SLIDE bullets
# RVM

* Pros:
    * Widely used and supported.
    * Easy to install and switch between Ruby versions.
    * Set Ruby per project.
    * "gemsets".
    * Can install required system deps for you.
    * Update RVM using RVM.
    * Does a lot.
* Cons:
    * Does a lot.
    * Rare, but PATH problems when using with multi-user environment.
    * Redefines shell commands.

!SLIDE bullets
# rbenv

* Pros:
    * Widely used and supported.
    * Easy to install and switch between Ruby versions.
    * Set Ruby per project.
    * Lots of plugins! (i.e. install only features you want).
    * Update rbenv using git.
    * Attempts to be lightweight (vs. RVM).
* Cons:
    * Doesn't install system deps for you.
    * Uses "shims" to use versioned Ruby.
    * Have to install plugins if you want RVM-like features.

!SLIDE bullets
# chruby

* Pros:
    * No shell command mucking, nor shims--just updates PATH (etc.) for you.
    * Easy to install and switch between Ruby versions.
    * Set Ruby per project.
    * Super small (~90 LOC).
    * Update chruby using git.
    * Attempts to be super lightweight (vs. RVM & rbenv).
    * Can use some rbenv-related plugins.
* Cons:
    * No system dep installing.
    * No bells & whistles.
    * Not as widely used as RVM and rbenv.

!SLIDE bullets
# RubyInstaller

* Pros:
    * De facto method for installing on Windows.
    * Installs all deps for you.
    * OpenSSL, Zlib, Readline
    * DevKit required for building C-extensions, which you'll probably need.
    * Feels Windows-esque.
* Cons:
    * Further from *nix (obviously).
    * Can only maintain 1 Ruby version at a time.

!SLIDE bullets
# cygwin

* Pros:
    * Can install Ruby via a package, or use 3rd party *nix tool.
    * Feels more like *nix.
    * The geekier option for Windows.
* Cons:
    * Feels more like *nix.
    * Can be problematic resolving deps that were made outside of cygwin.
    * Cygwin install required, which is more work up front than RubyInstaller.

!SLIDE bullets
# RailsInstaller

* Pros:
    * Installs everything you need for your platform to get started.
        * SQLite and SQL Server Support
        * Git
        * Ruby, Rails
    * GUI stuff.
    * Written by smart people.
* Cons:
    * Not sure, I've never used it!
    * Seems to be lagging behind with updates.

!SLIDE bullets
# Installing Ruby, Summary

* Use a 3rd party installer unless you don't have a choice.
* Use whichever works for you.
* Try them out--it's easy to wipe and start fresh.
* I like rbenv.
    * Not too much, not too little.


