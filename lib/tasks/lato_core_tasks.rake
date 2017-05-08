include LatoCore::Interface

# Task used to generate configs for every lato module installed on the application.
desc "Generate configs files for all lato modules on main application"
task :lato_load_configs do
  core__generate_modules_application_configs
end

# Task used to generate languages for every lato module installed on the application.
desc "Generate languages for all lato modules on main application"
task :lato_load_languages do
  core__generate_modules_application_languages
end
