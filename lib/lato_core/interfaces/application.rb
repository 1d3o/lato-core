module LatoCore

  # This module contains a list of functions used to get application informations.
  # Information about the application are saved on a global variable APPLICATION.
  module Interface::Application

    # This function return the default language set on main application (I18l).
    def core__get_application_language
      I18n.locale
    end

    # This function return the list of gems used by the application.
    def core__get_application_gems
      gems = {}
      Bundler.load.specs.each do |spec|
        gems[spec.name] = spec.version
      end
      gems
    end

    # This function return the root path of the application.
    def core__get_application_root_path
      Rails.root.to_s
    end

    # This function return the path of the application logo for the sidebar.
    def core__get_application_logo_sidebar_path
      dir = "#{core__get_application_root_path}/app/assets/images/lato/"
      if File.exist?("#{dir}/logo_sidebar.svg")
        return 'lato/logo_sidebar.svg'
      elsif File.exist?("#{dir}/logo_sidebar.png")
        return 'lato/logo_sidebar.png'
      elsif File.exist?("#{dir}/logo_sidebar.jpg")
        return 'lato/logo_sidebar.jpg'
      elsif File.exist?("#{dir}/logo_sidebar.gif")
        return 'lato/logo_sidebar.gif'
      end
      core__get_application_logo_path
    end

    # This function return the path of the application logo.
    def core__get_application_logo_path
      dir = "#{core__get_application_root_path}/app/assets/images/lato/"
      if File.exist?("#{dir}/logo.svg")
        return 'lato/logo.svg'
      elsif File.exist?("#{dir}/logo.png")
        return 'lato/logo.png'
      elsif File.exist?("#{dir}/logo.jpg")
        return 'lato/logo.jpg'
      elsif File.exist?('#{dir}/logo.gif')
        return 'lato/logo.gif'
      end
    end

    # This function create and return the path of configs on main application.
    def core__get_application_lato_configs_path
      absolute_path = "#{core__get_application_root_path}/config/lato"
      # create directory if not exist
      FileUtils.mkdir_p(absolute_path) unless File.exist?(absolute_path)
      # return directory
      absolute_path
    end

  end
end
