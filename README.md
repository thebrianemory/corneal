![Corneal](http://thebrianemory.github.io/corneal/images/corneal-small.png)

## Why this exists

When I was creating my first major Sinatra project, [Cook This Way](https://github.com/thebrianemory/cook-this-way), while doing [Learn Verified](https://learn.co/with/thebrianemory), I was looking for a way to build a Sinatra skeleton similar to running

    rails new APP-NAME

[Hazel](https://github.com/c7/hazel) was the closest thing I could find and this gem is based largely off of it. While it did provide a pretty good initial setup, I still had to tweak some things. The views were sitting in the root directory while I wanted them to reside in an app folder along with my models and controllers. There was also no environment.rb in the config folder as I had become accustom to having.

I also wanted to create a gem for future Learn students so they could easily get started building their projects. Although built with them in mind, this can get you off and running with any Sinatra app.

Install the gem, run `corneal new APP-NAME`, run `bundle install`, and you're all set! You can start up your server with `shotgun` and verify everything is working. It is as simple as that.

It uses a file structure similar to what you would see with Rails.

Directory structure:
```
├── config.ru
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── README
├── app
│   ├── controllers
│   │   └── application_controller.rb
│   ├── models
│   └── views
│       ├── layout.erb
│       └── welcome.erb
├── config
│   ├── initializers
│   └── environment.rb
├── db
│   └── migrate
├── lib
│   └── .gitkeep
└── public
|   ├── images
|   ├── javascripts
|   └── stylesheets
|       └── main.css
└── spec
    ├── application_controller_spec.rb
    └── spec_helper.rb
```


## Installation

    gem install corneal

## Commands
```
corneal -v              # Show Corneal version number
corneal help [COMMAND]  # Describe available commands or one specific command
corneal new APP-NAME    # Creates a new Sinatra application
corneal model NAME      # Generate a model
corneal controller NAME # Generate a controller
corneal scaffold NAME   # Generate a model with its associated views and controllers
```
The controller generator also have an optional views flag `--no-views` to create controllers without views.

## Using Corneal

To generate your app:

    corneal new APP-NAME

After Corneal is done generating your app, run `bundle install` from your app's directory:

    cd APP-NAME
    bundle install

You can then start your server with `shotgun`:

    shotgun

You can generate a model and migration file:

    corneal model NAME

You can also generate an entire MVC structure complete with a migration file:

    corneal scaffold NAME

The resulting structure will look like this:

```
└─app
  ├── controllers
  │   ├──application_controller.rb
  │   └──new_model_controller.rb
  ├── models
  │   └──new_model.rb
  └── views
      ├──new_models
      │  ├──index.html.rb.erb
      │  ├──show.html.rb.erb
      │  ├──new.html.rb.erb
      │  └──edit.html.rb.erb
      ├── layout.erb
      └── welcome.erb
```

You can also add your model attributes when you generate the scaffold structure and have them added to your migration file:

    corneal [model/scaffold] NAME name:string age:integer

```
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.age :integer

      t.timestamps null: false
    end
  end
end
```

Visit [http://localhost:9393/](http://localhost:9393/) to verify your app is running.

You can also verify it is working by running `rspec` to see the passing test:

    1 example, 0 failures

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thebrianemory/corneal This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

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
