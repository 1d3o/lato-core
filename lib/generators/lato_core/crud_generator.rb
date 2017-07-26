# frozen_string_literal: true

require 'rails/generators/base'

module LatoCore
  # CrudGenerator.
  class CrudGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    desc 'This function initialize your Rails project to get all crud files.'
    def create_crud_file
      # copy controller
      copy_file(
        'controllers/crud_controller.rb',
        'app/controllers/lato/crud_controller.rb'
      )
      # copy views
      directory(
        'views/crud',
        'app/views/lato/crud'
      )
    end

  end
end
