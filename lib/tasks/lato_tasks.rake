# frozen_string_literal: true

include LatoCore::Interface

desc 'Lato general tasks'
namespace :lato do
  desc 'Load lato modules configs on main application if they are not present'
  task :load_configs do
    generate_modules_application_configs(false)
  end

  desc 'Load lato modules configs on main application or rewrite them'
  task :load_configs_forced do
    generate_modules_application_configs(true)
  end

  desc 'Load lato modules languages on main application if they are not present'
  task :load_languages do
    generate_modules_application_languages('default', false)
  end

  desc 'Load lato modules languages on main application or rewrite them'
  task :load_languages_forced do
    generate_modules_application_languages('default', true)
  end
end

# Load configs:
##############################################################################

# This function generates on the main application the configs files for
# every lato module.
def generate_modules_application_configs(forced = false)
  lato_modules = core__get_modules_list
  lato_modules.each do |lato_module_name|
    generate_module_application_configs(lato_module_name, forced)
  end
end

# This function generates on the main application the configs files for
# a specific lato module.
def generate_module_application_configs(module_name, forced = false)
  # find directories path
  application_config_path = core__get_application_lato_configs_path
  module_root_path = core__get_module_root_path(module_name)
  # find configs files path
  configs_from_file_path = "#{module_root_path}/config/configs.yml"
  config_to_file_path = "#{application_config_path}/#{module_name}.yml"
  # copy file from module to main application (if it's possible)
  if !forced && File.exist?(config_to_file_path)
    puts "Already exist: #{config_to_file_path}"
    return
  end
  FileUtils.cp configs_from_file_path, config_to_file_path
  puts "Generated: #{config_to_file_path}"
end

# Load languages:
##############################################################################

def generate_modules_application_languages(language = 'default', forced = false)
  lato_modules = core__get_modules_list
  lato_modules.each do |lato_module_name|
    generate_module_application_languages(lato_module_name, language, forced)
  end
end

def generate_module_application_languages(module_name, language = 'default', forced = false)
  # find directories path
  application_config_path = core__get_application_lato_configs_path
  module_root_path = core__get_module_root_path(module_name)
  # find languages files path
  lang_from_file_path = "#{module_root_path}/config/languages/#{language}.yml"
  lang_from_file_path = "#{module_root_path}/config/languages/default.yml" unless File.exist?(lang_from_file_path)
  lang_to_file_path = "#{application_config_path}/#{module_name}_locale.yml"
  # copy file from module to main application (if it's possible)
  if !forced && File.exist?(lang_to_file_path)
    puts "Already exist: #{lang_to_file_path}"
    return
  end
  FileUtils.cp lang_from_file_path, lang_to_file_path
  puts "Generated: #{lang_to_file_path}"
end
