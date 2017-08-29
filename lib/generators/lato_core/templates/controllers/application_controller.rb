# frozen_string_literal: true

module Lato
  # ApplicationController.
  class ApplicationController < ::ApplicationController

    # set lato layout
    layout 'lato_core/admin'

    # initialize cells dependencies
    before_action :core__cells_initialize
    # manage superuser session for security
    before_action :core__manage_superuser_session

    def index
      # set current menu active page
      core__set_menu_active_item('sample_page')
      # set current page title
      core__set_header_active_page_title('Sample page')
    end

  end
end
