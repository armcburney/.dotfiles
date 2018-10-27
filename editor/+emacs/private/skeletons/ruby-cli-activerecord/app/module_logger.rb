# frozen_string_literal: true

require 'logger'

module |main|
  #
  # Custom logging module.
  #
  module Logger
    module_function

    # Configure logger
    @logger = ::Logger.new(STDOUT)

    # Print custom logger message
    def hello_world
      @logger.info("Hello World.")
    end
  end
end
