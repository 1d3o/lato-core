# Lato Core 2.0

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