# frozen_string_literal: true

require 'rails/generators/base'

module LatoCore
  # InitializerGenerator.
  class InitializerGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    desc 'This function initialize your Rails project to support Lato.'
    def create_initializer_file
      # copy controller
      copy_file(
        'controllers/application_controller.rb',
        'app/controllers/lato/application_controller.rb'
      )
      # copy view
      copy_file(
        'views/application/index.html.erb',
        'app/views/lato/application/index.html.erb'
      )
      # copy stylesheets theme file
      copy_file(
        'assets/stylesheets/theme.scss.erb',
        'app/assets/stylesheets/lato/theme.scss.erb'
      )
      # copy stylesheets application file
      copy_file(
        'assets/stylesheets/application.scss',
        'app/assets/stylesheets/lato/application.scss'
      )
      # copy javascripts application file
      copy_file(
        'assets/javascripts/application.js',
        'app/assets/javascripts/lato/application.js'
      )
      # copy images logo file
      copy_file(
        'assets/images/logo.svg',
        'app/assets/images/lato/logo.svg'
      )
    end

  end
end
