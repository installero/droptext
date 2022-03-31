require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Droptext
  class Application < Rails::Application
    config.load_defaults 7.0
    config.time_zone = 'Moscow'
    config.i18n.default_locale = :ru
  end
end
