# frozen_string_literal: true

require_relative "script"

module Scripts
  class VC < Script
    def self.description
      "Run a command on a vagrant machine."
    end

    def self.execute!(params = {})
      Error.not_enough_arguments(1) if params[:command].nil?

      command = Commands::VagrantSsh.new(command: params[:command])
      command.run!
    end
  end
end
