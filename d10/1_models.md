!SLIDE title
# More on Models


!SLIDE bullets
# It all starts with a migration.

* [Active Record Migrations](http://guides.rubyonrails.org/migrations.html)
* What's it again?
    * A DSL for writing SQL to change your DB.
    * A way to version your DB.
    * A changelog for your DB.
    * A way to recreate your DB, wherever.


!SLIDE bullets
# Tidbits

* On failed migrations...

> On databases that support transactions with statements that change the schema,
> migrations are wrapped in a transaction. If the database does not support this
> then when a migration fails the parts of it that succeeded will not be rolled
> back. You will have to rollback the changes that were made by hand.

!SLIDE bullets
# `change`

* For easy stuff, Rails knows how to roll forward and backward.
* [This](https://github.com/turboladen/flockr/blob/master/db/migrate/20130911051010_create_photos.rb)
  could've been written like:

  ```ruby
      class CreatePhotos < ActiveRecord::Migration
        def up
          create_table :photos do |t|
            t.string :file_name
            t.string :path

            t.timestamps
          end
        end

        def down
          remove_table :photos
        end
      end
  ```

!SLIDE incremental bullets
# What's with those filenames again?

* Our first Flockr migration file: `20130911051010_create_photos.rb`
* Timestamp tells Rails order to apply migrations.
    * One reason to use the migration generator.
* `create_photos` maps to the name of the new migration class:

    ```ruby
    class CreatePhotos < ActiveRecord::Migration
    ```
    * Errors if duplicate class names, so think first!


!SLIDE
# Generating Migrations

> If the migration name is of the form "AddXXXToYYY" or "RemoveXXXFromYYY" and
> is followed by a list of column names and types then a migration containing
> the appropriate add_column and remove_column statements will be created.

Thus, `rake g migration AddUsernameToUser username:string` ->
[AddUsernameToUser](https://github.com/turboladen/flockr/blob/master/db/migrate/20130912204904_add_username_to_user.rb).


!SLIDE
# Generating Migrations (cont.)

> If the migration name is of the form "CreateXXX" and is followed by a list of
> column names and types then a migration creating the table XXX with the
> columns listed will be generated.

Thus, `rake g migration CreateUsers email:string` ->
[CreateUsers](https://github.com/turboladen/flockr/blob/master/db/migrate/20130912063809_create_users.rb).


!SLIDE
# Generating Migrations (cont.)

> Also, the generator accepts column type as references(also available as
> belongs_to).

* Remember?

    ```bash
    rake g migration create_comments body:string user:references photo:references`
    ```
* That could've been:

    ```bash
    rake g migration create_comments body:string user:belongs_to photo:belongs_to`
    ```
* Note that `references` and `belongs_to` creates the FK, but also creates an index.


!SLIDE
# Generating Migrations (cont.)

* [Supported Type Modifiers](http://guides.rubyonrails.org/migrations.html#supported-type-modifiers).


!SLIDE
# Creating Tables

> By default, `create_table` will create a primary key called `id`. You can change
> the name of the primary key with the `:primary_key` option (don't forget to
> update the corresponding model) or, if you don't want a primary key at all,
> you can pass the option `id: false`. If you need to pass database specific
> options you can place an SQL fragment in the `:options` option.


!SLIDE
# Kick it OG style

> If the helpers provided by Active Record aren't enough you can use the execute
> method to execute arbitrary SQL:

```ruby
Products.connection.execute('UPDATE `products` SET `price`=`free` WHERE 1')
```

!SLIDE
# More `change`

* You can do these things when `change`ing:
    * add_column
    * add_index
    * add_reference
    * add_timestamps
    * create_table
    * create_join_table
    * drop_table (must supply a block)
    * drop_join_table (must supply a block)
    * remove_timestamps
    * rename_column
    * rename_index
    * remove_reference
    * rename_table


!SLIDE incremental
# Running Migrations

* `rake db:migrate` runs `change` or `up` for all migrations that haven't been run,
  in timestamp order.
* `rake db:migrate` invokes `db:schema:dump`, which is what updates `db/schema.rb`.
* Run migrations up to a point in time?

    ```bash
    $ rake db:migrate VERSION=20130912063809
    ```
    * will migrate `up` or `down`, depending on where you're at.


!SLIDE incremental bullets
# Rolling Back

* Just go back 1 step:

    ```bash
    $ rake db:rollback
    ```
* Go back 3 steps:

    ```bash
    $ rake db:rollback STEP=3
    ```
* Go back, then forward 3 steps:

    ```bash
    $ rake db:migrate:redo STEP=3
    ```

!SLIDE
# Reset?

* `rake db:reset` will drop, recreate, and load the current schema (from `db/schema.rb`).
* Or create your own...

   ```ruby
   namespace :db do
     desc 'Shortcut for db:drop && db:create && db:migrate'
     task :clean do
       Rake::Task['db:drop'].invoke
       Rake::Task['db:create'].invoke
       Rake::Task['db:migrate'].invoke
     end
   end
   ```

!SLIDE
# More on Schema Files

* `db/schema.rb` is the authoritative source for your DB schema--not migrations.

> There is no need (and it is error prone) to deploy a new instance of an app
> by replaying the entire migration history. It is much simpler and faster to
> just load into the database a description of the current schema.


!SLIDE
# More on Schema Files (cont.)

* `db/schema.rb` is like the summary of your migrations.
* It's created by inspecting the DB and expressing its state.
* It's DB independent!
* When dumping to `.rb` it can't express:
    * foreign key constraints
    * triggers
    * stored procedures
* So use Rails' ability to dump to `.sql` if you need those.
    * `rake db:structure:dump` -> `db/structure.sql`


!SLIDE questions center
# Questions?
