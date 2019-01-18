# Lato Core

[![Gem Version](https://badge.fury.io/rb/lato_core.svg)](https://badge.fury.io/rb/lato_core)

Lato is a Rails engine used to develop modular admin panels. This is the module used to initialize the admin panel.
The complete documentation is inside the application panel, so you must [install](#installation) it before.

![Lato dashboard screenshot](lib/screen.png)

## Ecosystem

- [Lato core](https://github.com/ideonetwork/lato-core): The core module used to initialize the panel.
- [Lato media](https://github.com/ideonetwork/lato-media): A module used to manage attachments and media files.
- [Lato blog](https://github.com/ideonetwork/lato-blog): A module to manage blog contents.

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

## Command line interface

Lato has some commands that can be used to generate files and configurations.

Inside the Lato admin panel there is a specific list of all command line commands that can be used to work with a lato project.

### Configuration

```console
rails lato:load_configs
```

This command should create a list of **lato_*.yml** files inside **config/lato** containing settings and configuration of every module.

### Languages

```console
rails lato:load_languages
```

This command should create a list of **lato_*_lang.yml** files inside **config/lato** containing strings that can be replaced for every lato module.

### Generators

#### Initializer

```console
rails generate lato_core:initializer
```

This command should create some files that helps you to start to develop with lato.

#### Scaffold

```console
rails generate lato_core:scaffold ModelName
```
