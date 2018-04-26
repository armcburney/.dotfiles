# frozen_string_literal: true

require_relative "../package_installer"
require_relative "../child/pip"

module SetUp
  class Pyenv < PackageInstaller
    def initialize
      super(nil, [Pip.new(self)])
    end
  end
end
