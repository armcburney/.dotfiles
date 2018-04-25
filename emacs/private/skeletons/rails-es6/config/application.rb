# frozen_string_literal: true

require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module __PROJECT-NAME__
  class Application < Rails::Application
    config.sass.preferred_syntax = :sass

    config.generators do |g|
      g.javascripts false
      g.scaffold_stylesheet false
      g.stylesheets false
      g.template_engine :slim
      g.test_framework :rspec
    end
  end
end
