# frozen_string_literal: true

require_relative "script"

module Scripts
  class DevPort < Script
    def self.description
      "Forwards a port from my workstation to my local machine."
    end

    def self.execute!(params = {})
      Error.not_enough_arguments(1) if params[:source].nil?

      source_port = params[:source]
      dest_port   = params[:dest] || source_port

      command = Commands::Ssh.new(
        workstation: Const::EC2::WORKSTATION,
        ports: { source_port => dest_port }
      )
      status = command.run!
      UI.error("Error running #{script_name} command") unless status.success?
    end

    def self.usage
      "#{script_name} <source_port> <optional:dest_port>"
    end
  end
end
