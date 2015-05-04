# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Mybaby::Application.initialize!
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")

#config.gem 'tiny_mce'
