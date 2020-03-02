require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kellaapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
     config.assets.paths << Rails.root.join("app", "assets", "font", "roboto")
   config.assets.paths << Rails.root.join("vendor", "assets", "img")
  config.assets.paths << Rails.root.join("vendor", "assets", "mdb-addons")
   config.assets.paths << Rails.root.join("vendor", "assets", "addons-pro")
    config.assets.paths << Rails.root.join("vendor", "assets", "flash")
       config.assets.paths << Rails.root.join("vendor", "assets", "addons-pro")
   

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    ENV['RAILS_ADMIN_THEME'] = 'rollincode'
    
  end
end
