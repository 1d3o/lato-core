# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'lato_core/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'lato_core'
  s.version     = LatoCore::VERSION
  s.authors     = ['Ideonetwork']
  s.email       = ['info@ideonetwork.it']
  s.homepage    = 'http://naturaldesign.cc/'
  s.summary     = 'Lato core module'
  s.description = 'Lato is a modular management system for Rails'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  # Dependencies:

  s.add_runtime_dependency 'rails', '~> 5.1', '>= 5.1.0'

  # front-end -> sass compiler
  # doc: https://github.com/rails/sass-rails
  s.add_runtime_dependency 'sass-rails', '~> 5.0'

  # front-end -> javascript assest compressor
  # doc: https://github.com/lautis/uglifier
  s.add_runtime_dependency 'uglifier', '~> 1.3', '>= 1.3.0'

  # front-end -> use the old good jquery
  # doc: https://github.com/rails/jquery-rails
  s.add_runtime_dependency 'jquery-rails', '~> 3.0', '>= 3.0.1'

  # front-end -> use view components
  # doc: https://github.com/trailblazer/cells
  s.add_runtime_dependency 'cells', '~> 4.0', '>= 4.0.0'
  s.add_runtime_dependency 'cells-erb', '~> 0'

  # user password crypt
  # doc: https://github.com/codahale/bcrypt-ruby
  s.add_runtime_dependency 'bcrypt', '~> 3.1', '>= 3.1.7'

  # JWT management
  # doc: https://github.com/jwt/ruby-jwt
  s.add_runtime_dependency 'jwt', '~> 1.5', '>= 1.5.4'

  # Dev dependencies:

  s.add_development_dependency 'sqlite3', '~> 0'

end
