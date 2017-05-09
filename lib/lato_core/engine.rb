module LatoCore
  class Engine < ::Rails::Engine
    isolate_namespace LatoCore

    require 'rubygems'
    require 'sass-rails'
    require 'uglifier'
    require 'jquery-rails'
    require 'cells'
    require 'cells-erb'
    require 'bcrypt'
    require 'jwt'

    # add routes support
    initializer 'Add gem routes to application', before: :load_config_initializers do
      Rails.application.routes.append do
        mount LatoCore::Engine, at: '/lato/core'
      end
    end

  end
end
