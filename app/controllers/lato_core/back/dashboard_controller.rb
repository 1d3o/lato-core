module LatoCore
  class Back::DashboardController < Back::BackController

    before_action do
      core__set_menu_active_item('core_dashboard')
      core__set_header_active_page_title(LANGUAGES[:lato_core][:pages][:dashboard])
    end

    def index
      # set widgets data
      @superusers = LatoCore::Superuser.all.order('last_login_datetime DESC')
    end

  end
end