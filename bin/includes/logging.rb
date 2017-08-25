# frozen_string_literal: true

require "logger"

module SetUp
  module Logging
    def logger
      Logging.logger
    end

    def self.logger
      @logger ||= ::Logger.new(STDOUT)
    end
  end
end
