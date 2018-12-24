# frozen_string_literal: true

require_relative "script"

module Scripts
  class DevCopy < Script
    def self.description
      "Copy a directory from my workstation to my local machine."
    end

    def self.execute!(params = {})
      command = Commands::Scp.new(workstation: Const::EC2::WORKSTATION, **params)
      status = command.run!
      UI.error("Error running #{script_name} command") unless status.success?
    end

    def self.usage
      "#{script_name} </remote/file/path> </local/file/path>"
    end
  end
end
