module LatoCore

  # ApplicationController
  class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    def index
      redirect_to lato_core.dashboard_path
    end

  end

end
