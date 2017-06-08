module LatoCore
  class Back::DashboardController < Back::BackController

    before_action do
      core__set_menu_active_item('core_dashboard')
    end

    def index
      core__set_header_active_page_title(LANGUAGES[:lato_core][:pages][:dashboard])
    end

  end
end