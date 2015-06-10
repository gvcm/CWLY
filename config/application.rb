require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Cwgl
  class Application < Rails::Application
    config.assets.paths << Rails.root.join('assets')
    config.action_controller.include_all_helpers = false
  end
end
