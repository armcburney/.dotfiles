# frozen_string_literal: true

require 'rubygems'
require 'bundler'

# Use bundler to automatically require gems needed
Bundler.require(:default)

# Path to main sinatra server
require './app.rb'

map '/assets' do
  # Configure Sprockets environment
  environment = Sprockets::Environment.new

  # append assets paths
  environment.append_path 'assets/images'
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'

  # compress assets
  environment.js_compressor  = :uglify
  environment.css_compressor = :sass

  run environment
end

run App.new
