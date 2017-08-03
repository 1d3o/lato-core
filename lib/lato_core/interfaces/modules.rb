module LatoCore
  # This module contains a list of functions used to work and manage other
  # lato modules.
  module Interface::Modules

    # Helpers:
    ############################################################################

    # This function return the root path of a specific module.
    def core__get_module_root_path(module_name)
      Gem.loaded_specs[module_name].full_gem_path
    end

    # This function returns the list of lato modules installed on main application.
    def core__get_modules_list
      all_gems = core__get_application_gems.keys
      lato_gems = []
      # check every gem
      all_gems.each do |name|
        lato_gems.push(name) if name.start_with? 'lato'
      end
      # return result
      lato_gems
    end

    # Languages:
    ############################################################################

    # This function returns an object with languages for every module.
    def core__get_modules_languages
      lato_modules = core__get_modules_list
      languages = {}
      lato_modules.each do |lato_module_name|
        languages[lato_module_name.to_sym] = core__get_module_languages(lato_module_name)
      end
      languages
    end

    # This function load languages for a specific module.
    # This config are generated from the merge of application languages
    # for the module and default languages of the module.
    def core__get_module_languages(module_name)
      default_languages = core__get_module_default_languages(module_name)
      application_languages = core__get_module_application_languages(module_name)
      return default_languages unless application_languages

      default_languages.each do |key, value|
        application_languages[key] = value unless application_languages[key]
      end

      application_languages
    end

    # This function load default languages for a specific module.
    def core__get_module_default_languages(module_name)
      module_root_path = core__get_module_root_path(module_name)
      core__read_yaml("#{module_root_path}/config/languages/default.yml")
    end

    # This function load application languages for a specific module.
    def core__get_module_application_languages(module_name)
      application_config_path = core__get_application_lato_configs_path
      absolute_path = "#{application_config_path}/#{module_name}_locale.yml"
      core__read_yaml(absolute_path)
    end

    # Configs:
    ############################################################################

    # This function returns an object with configs for every module.
    def core__get_modules_configs
      lato_modules = core__get_modules_list
      configs = {}
      lato_modules.each do |lato_module_name|
        configs[lato_module_name.to_sym] = core__get_module_configs(lato_module_name)
      end
      configs
    end

    # This function load configs for a specific module.
    # This configs are generated from the merge of application configs for the module
    # and default configs of the module.
    def core__get_module_configs module_name
      default_config = core__get_module_default_configs(module_name)
      application_config = core__get_module_application_configs(module_name)
      return default_config unless application_config

      default_config.each do |key, value|
        application_config[key] = value unless application_config[key]
      end

      return application_config
    end

    # This function load application configs for a specific module.
    def core__get_module_application_configs module_name
      application_config_path = core__get_application_lato_configs_path
      absolute_path = "#{application_config_path}/#{module_name}.yml"
      return core__read_yaml(absolute_path)
    end

    # This function load default configs for a specific module.
    def core__get_module_default_configs module_name
      module_root_path = core__get_module_root_path(module_name)
      absolute_path = "#{module_root_path}/config/configs.yml"
      return core__read_yaml(absolute_path)
    end

  end
end
