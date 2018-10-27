# frozen_string_literal: true

require 'rubygems'
require 'bundler'
require 'yaml'

Bundler.require(:default)

require_relative 'database/database.rb'

#
# |main| module
#
module |main|
  # Logger accessible module-wide
  require_relative 'module_logger.rb'

  #
  # Thor CLI class
  #
  class CLI < Thor
    desc 'command', 'description'
    option :option, aliases: 'o', type: :string, default: ''
    def command() end
  end
end
