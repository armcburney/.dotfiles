# frozen_string_literal: true

require_relative "script"

module Scripts
  class Dev < Script
    def self.description
      "SSH into my workstation from my local machine."
    end

    def self.execute!(params = {})
      command = Commands::Ssh.new(workstation: Const::EC2::WORKSTATION, **params)
      status = command.run!
      UI.error("Error running #{script_name} command") unless status.success?
    end
  end
end
