module LatoCore

  # This module contains a list of general functions used as helpers on the system.
  module Interface::General

    # This function takes a path to a yaml file and return the hash with yaml data
    # or nil if file not exist.
    def core__read_yaml file_path
      begin
        # return nil if file not exist
        return unless File.exist?(file_path)
        config_file = File.read(file_path)
        # return yaml data
        return YAML.load(config_file).with_indifferent_access
      rescue => error
        return
      end 
    end

    # This function return the substring inside two strings.
    def core__get_string_inside_strings string, marker1, marker2
      return string[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
    end

    # This function paginate an array and return the requested page.
    def core__paginate_array array, per_page, page
      start = (page - 1) * per_page
      return array[start, per_page]
    end

  end

end