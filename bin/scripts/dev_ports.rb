# frozen_string_literal: true

require_relative "script"

module Scripts
  class DevPorts < Script
    def self.description
      "Forwards a number of ports from my workstation to my local machine."
    end

    def self.execute!(params = {})
      ports = params[:ports].map { |v| [v, v] }.to_h

      command = Commands::Ssh.new(
        workstation: Const::EC2::WORKSTATION,
        ports: ports
      )
      status = command.run!
      UI.error("Error running #{script_name} command") unless status.success?
    end

    def self.usage
      "#{script_name} <port_1>, ..., <port_n>"
    end
  end
end
