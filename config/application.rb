require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NerdTalking
    class Application < Rails::Application
        config.autoload_paths << Rails.root.join('lib')
        config.assets.paths << Rails.root.join('node_modules')
        config.assets.paths << Rails.root.join('bower_components')
        # Settings in config/environments/* take precedence over those specified here.
        # Application configuration should go into files in config/initializers
        # -- all .rb files in that directory are automatically loaded.
    end
end
