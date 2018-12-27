# frozen_string_literal: true

require_relative "script"

module Scripts
  class Dev < Script
    def self.description
      "SSH into my workstation from my local machine."
    end

    def self.execute!(params = {})
      command = Commands::Ssh.new(workstation: Const::EC2::WORKSTATION, **params)
      command.run!
    end
  end
end
