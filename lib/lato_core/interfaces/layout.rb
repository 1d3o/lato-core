module LatoCore

  # This module contains a list of functions used to mange the admin layout.
  module Interface::Layout

    # Helpers:

    # This function set the current active page title on the header.
    def core__set_header_active_page_title title
      @core__header_active_page_title = title
    end

    # This function set the current active page on the menu.
    def core__set_menu_active_item item_key
      @core__menu_active_item = item_key
    end

    # Header widgets:

    # This function return a list of header widgets for the header of the layout.
    def core__get_header_widgets
      lato_modules = core__get_modules_list
      # create list of header widgets
      header_widgets = []
      lato_modules.each do |lato_module_name|
        module_header_widgets = core_get_header_widgets_for_module(lato_module_name)
        header_widgets = header_widgets + module_header_widgets if module_header_widgets
      end
      # sort items and return them
      header_widgets = header_widgets.sort_by {|header_widget| header_widget[:position]}
      return header_widgets.reverse
    end

    # This function return the list of header widgets for a specific module.
    def core_get_header_widgets_for_module module_name
      module_configs = core__get_module_configs(module_name)
      return [] unless module_configs
      # load module items
      module_header_widgets = []
      if module_configs[:header_widgets]
        module_configs[:header_widgets].each do |key, value|
          module_header_widgets.push(core__generate_header_widget(key, value, module_name))
        end
      end
      # return module items
      return module_header_widgets
    end

    # This function create a correct header widget object for the header.
    def core__generate_header_widget key, values, module_name
      header_widget = {}
      header_widget[:key] = key
      header_widget[:icon] = values[:icon] ? values[:icon] : 'check-circle'
      header_widget[:path] = values[:path] ? values[:path] : ''
      header_widget[:position] = values[:position] ? values[:position] : 999
      return header_widget
    end

    # Menu:

    # This function returns the list of the items for the menu.
    def core__get_menu_items
      lato_modules = core__get_modules_list
      # create list of menu items
      menu_items = []
      lato_modules.each do |lato_module_name|
        module_menu_items = core_get_menu_items_for_module(lato_module_name)
        menu_items = menu_items + module_menu_items if module_menu_items
      end
      # sort items and return them
      menu_items = menu_items.sort_by {|menu_item| menu_item[:position]}
      return menu_items
    end

    # This function returns the list of the items for the menu for a specific module.
    def core_get_menu_items_for_module module_name
      module_configs = core__get_module_configs(module_name)
      return [] unless module_configs
      # load module items
      module_menu_items = []
      if module_configs[:menu_items]
        module_configs[:menu_items].each do |key, value|
          module_menu_items.push(core__generate_menu_item(key, value, module_name))
        end
      end
      # return module items
      return module_menu_items
    end

    # This function create a correct menu item object for the menu.
    def core__generate_menu_item key, values, module_name
      menu_item = {}
      menu_item[:key] = key
      menu_item[:title] = values[:title] ? core__get_menu_title_translation(values[:title], module_name) : 'Undefined'
      menu_item[:icon] = values[:icon] ? values[:icon] : 'check-circle'
      menu_item[:url] = values[:url] ? values[:url] : ''
      menu_item[:position] = values[:position] ? values[:position] : 999
      menu_item[:permission_min] = values[:permission_min] ? values[:permission_min] : 0
      menu_item[:permission_max] = values[:permission_max] ? values[:permission_max] : 999
      menu_item[:sub_items] = []

      if values[:sub_items]
        values[:sub_items].each do |key, value|
          menu_item[:sub_items].push(core__generate_menu_sub_item(key, value, module_name))
        end
      end
      
      return menu_item
    end

    # This function create a correct menu sub itam object for the menu.
    def core__generate_menu_sub_item key, values, module_name
      menu_sub_item = {}
      menu_sub_item[:key] = key
      menu_sub_item[:title] = values[:title] ? core__get_menu_title_translation(values[:title], module_name) : 'Undefined'
      menu_sub_item[:url] = values[:url] ? values[:url] : ''
      menu_sub_item[:permission_min] = values[:permission_min] ? values[:permission_min] : 0
      menu_sub_item[:permission_max] = values[:permission_max] ? values[:permission_max] : 999
      return menu_sub_item
    end

    # This function check the title name and, if it need a translaction, it return the value.
    def core__get_menu_title_translation title, module_name
      return title if (!title.start_with?('translate'))

      title_key = core__get_string_inside_strings(title, '[', ']')
      module_languages = core__get_module_languages(module_name)
      return title if !module_languages || !module_languages[:menu] || !module_languages[:menu][title_key]

      return module_languages[:menu][title_key]
    end

    # Assets:

    # This function return an array with the list of assets for lato modules.
    def core_get_assets
      lato_modules = core__get_modules_list
      # create list of menu assets
      assets = []
      lato_modules.each do |lato_module_name|
        module_assets = core_get_assets_for_module(lato_module_name)
        assets = assets + module_assets if module_assets
      end
      # return assets
      return assets
    end

    # This function return the lists of assets for a specific module.
    def core_get_assets_for_module module_name
      module_configs = core__get_module_configs(module_name)
      return [] unless module_configs
      # load module assets
      module_assets = []
      if module_configs[:assets]
        module_configs[:assets].each do |key, value|
          module_assets.push(value)
        end
      end
      # return module assets
      return module_assets
    end

  end
end