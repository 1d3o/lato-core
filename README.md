# Lato Core

## Installation

Add the lato_core gem on your Gemfile

```ruby
gem 'lato_core'
```

Install the gem

```console
bundle install
```

Copy the migrations

```console
rails lato_core:install:migrations
```

Exec migrations

```console
bundle exec rake db:migrate
```

Now you can start the server and go to the relative url */lato/core*

## Generators

Lato core gem contains a list of generators used to speed up the rails integration.

### Initialization

To initialize Lato core on a Rails application run:

```console
rails generate lato_core:initializer
```

### Sample crud

To create all the code used to manage a simple crud (views and controllers) you can run:

```console
rails generate lato_core:crud
```