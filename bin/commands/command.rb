# frozen_string_literal: true

require "open3"
require_relative "../shared/ui"

module Commands
  # Base class for commands to be run.
  class Command
    attr_reader :stout, :stderr, :status

    # The source for the command to execute.
    #
    # @return [String]
    def source
      raise "Not implemented."
    end

    # Runs the source command defined in the subclass concretion.
    #
    # @return [Process::Status]
    def run!
      Open3.popen3(source) do |_stdin, stdout, stderr, thread|
        UI.command(source)
        UI.command_output(stdout.read)

        @stdout = stdout
        @stderr = stderr
        @status = thread.value

        UI.error("ERROR:\n\n#{stderr.read}") unless status.success?
      end

      status
    end
  end
end
