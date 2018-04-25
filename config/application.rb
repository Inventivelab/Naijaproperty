require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Naijaproperty
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.action_view.sanitized_allowed_tags = ['strong', 'em', 'b', 'i', 'p', 'code', 'pre,' 'tt,' 'samp,' 'kbd', 'var,' 'sub',
    'sup', 'dfn', 'cite', 'big', 'small', 'address', 'hr', 'br', 'div', 'span', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'ul', 'ol', 'li', 'dl',
    'dt', 'dd' 'abbr', 'acronym', 'a', 'img', 'del', 'ins', 'colors', 'table', 'td', 'tr', 'url', 'video', 'source']

    config.action_view.sanitized_allowed_attributes = ['href', 'title', 'width', 'height', 'alt', 'cite', 'datetime', 'style', 'class', 'name', 'abbr', 'src']
    # config.filestack_rails.api_key = ENV['filestack_api_key']
    # config.filestack_rails.client_name = ENV['filestack_name']

  end
end
