module LatoCore
  class Doc::DocController < ApplicationController

    layout 'lato_core/admin'

    before_action :core__manage_superuser_session

    before_action do
      core__set_menu_active_item('core_documentation')
      core__set_header_active_page_title(LANGUAGES[:lato_core][:pages][:documentation])
    end

    def index; end

  end
end
