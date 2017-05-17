module LatoCore

  # ApplicationController
  class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    
    skip_before_action :verify_authenticity_token

    def index
      redirect_to lato_core.dashboard_path
    end

  end

end
