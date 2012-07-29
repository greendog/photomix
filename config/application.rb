require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Photomix
  class Application < Rails::Application
    
    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/   Dir["#{config.root}/lib/**/"]
    config.autoload_paths += %W(#{config.root}/lib #{config.root}/app/middleware/)
    config.active_record.observers = :secret_link_observer
    config.encoding = "utf-8"
    config.i18n.default_locale = :ru
    config.time_zone = 'Moscow'
    config.active_support.escape_html_entities_in_json = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.assets.precompile += %w( ajaxful_rating.css )

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirmation]
  end
end
