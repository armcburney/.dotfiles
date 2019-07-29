# frozen_string_literal: true

require_relative "command"
require_relative "../shared/constants.rb"

module Commands
  class VagrantSsh < Command
    def initialize(command:)
      @command = command
    end

    def source
      "vagrant ssh -c '#{command}'"
    end

    private

    attr_reader :command
  end
end
