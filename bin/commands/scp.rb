# frozen_string_literal: true

require_relative "command"
require_relative "../shared/constants.rb"

module Commands
  class Scp < Command
    def initialize(workstation:, remote:, local:)
      @workstation = workstation
      @remote      = remote
      @local       = local
    end

    def source
      "scp -r -i #{Const::EC2::PEM} #{workstation}:#{remote} #{local}"
    end

    private

    attr_reader :workstation, :remote, :local
  end
end
