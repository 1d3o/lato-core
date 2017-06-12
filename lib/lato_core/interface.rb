module LatoCore
  module Interface

    require 'lato_core/interfaces/general'
    include LatoCore::Interface::General

    require 'lato_core/interfaces/application'
    include LatoCore::Interface::Application

    require 'lato_core/interfaces/modules'
    include LatoCore::Interface::Modules

    require 'lato_core/interfaces/token'
    include LatoCore::Interface::Token

    require 'lato_core/interfaces/layout'
    include LatoCore::Interface::Layout

    require 'lato_core/interfaces/authentication'
    include LatoCore::Interface::Authentication

    require 'lato_core/interfaces/cells'
    include LatoCore::Interface::Cells

    require 'lato_core/interfaces/apihelpers'
    include LatoCore::Interface::Apihelpers

  end
end
