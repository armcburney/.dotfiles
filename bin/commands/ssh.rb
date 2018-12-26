# frozen_string_literal: true

require_relative "command"
require_relative "../shared/constants.rb"

module Commands
  class Ssh < Command
    def initialize(workstation:, ports: {})
      @workstation = workstation
      @ports       = ports
    end

    def source
      "ssh -i #{Const::EC2::PEM} #{workstation} #{tunnelled_ports}"
    end

    def run!
      exec(source)
    end

    private

    attr_reader :workstation, :ports

    def tunnelled_ports
      return "" if ports.nil?

      ports
        .map { |source, dest| "-L #{source}:localhost:#{dest}" }
        .join(" ")
    end
  end
end
