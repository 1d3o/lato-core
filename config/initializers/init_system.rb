include LatoCore::Interface

# Set global main variables:

# save on a global variable configs of all lato modules.
CONFIGS = core__get_modules_configs

# save on a global variable languages of all lato modules.
LANGUAGES = core__get_modules_languages

# save on a global variable settings and informations used to render layout.
LAYOUT = {
  logo: core__get_application_logo_path,
  logo_sidebar: core__get_application_logo_sidebar_path,
  menu_items: core__get_menu,
  widgets: core__get_widgets,
  partials: core__get_partials,
  assets: core__get_assets,
  colors: core__get_colors
}

# Set global core variables:

# set variables to get the list of possible permissions values
superusers_permissions_list = CONFIGS[:lato_core][:superusers_permissions].values.map{ |x| x[:value] }
CORE_SUPERUSERS_PERMISSIONS = superusers_permissions_list.sort.reverse

# Create first default system user:

# create first superuser if not other superusers are on system.
if ActiveRecord::Base.connection.table_exists? 'lato_core_superusers'
  if LatoCore::Superuser.all.empty?
    user_params = CONFIGS[:lato_core][:default_superuser]
    user_params[:password_confirmation] = user_params[:password]
    user_params[:permission] = user_params[:permission] || CORE_SUPERUSERS_PERMISSIONS.first
    user = LatoCore::Superuser.new(user_params)
    throw "Default user can not be created: #{user.errors.full_messages.to_sentence}" unless user.save
  end
end
