![Corneal](http://thebrianemory.github.io/corneal/images/corneal-small.png)

## Why this exists

When I was creating my first major Sinatra project, [Cook This Way](https://github.com/thebrianemory/cook-this-way) for [Learn Verified](https://learn.co/with/thebrianemory), I was looking for a way to build a skeleton similar to running

    rails new app-name

[Hazel](https://github.com/c7/hazel) was the closest thing I could find. While it did provide a pretty good initial setup, I still had to tweak some things. The views were sitting in the root directory while I wanted them to reside in an app folder along with my models and controllers.

I also wanted to create a gem for future Learn students so they could easily get started building their projects. Although built with them in mind, this can get you off and running with any Sinatra app.

## Installation

    gem install corneal

## Configuration

* `--capistrano` Include Capistrano
* `-d` Database. Options are "postgres," "mysql," "sqlite", and "mongo."
   Default is ""
* `--redis` Include Redis configuration options.
* `--rvm` Create .ruby-version (ruby-2.1.0) and .ruby-gemset
* `--bundle` Run bundle after generating the app
* `--git` Initialize a Git repository

## Example

Standard app, using sqlite.

    corneal app-name

App using MySQL and Redis.

    corneal app-name -d mysql --redis

App using MongoDB and Redis, then run bundle install.

    corneal app-name -d mongo --redis --bundle

App using Redis, RVM, and Git repo

    corneal app-name --redis --rvm --git-repo

After Corneal is done generating an app, you can `cd` into your apps
directory and `rackup`

    cd app-name; rackup

## Architecture

The template autoloads files in config/initializers and
/lib. Database configuration options are stored in `config/db.yml`
and are loaded via `config/initializers/database.rb`.

## DB Setup

[Sequel](http://sequel.rubyforge.org) is used as an ORM for
relational databases, and migrations are stored in db/migrate.
Migrations can be run using the rake command `rake db:migrate`.

[mongodb_model](https://github.com/alexeypetrushin/mongodb_model)
is used for Mongo apps, with the config options
stored in the same files as relational databases (`config/db.yml`
and `config/initializers/database.rb`).

### More information

*  [Sequel Migrations](http://sequel.rubyforge.org/rdoc/files/doc/migration_rdoc.html)
*  [Sequel Models](http://sequel.rubyforge.org/rdoc/classes/Sequel/Model.html)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thebrianemory/nfl-top-stories-cli-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

    Copyright (c) 2016 Brian Emory

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
    OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
