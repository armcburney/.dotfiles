# frozen_string_literal: true

require_relative "package_installer"

module SetUp
  class BrewCask < PackageInstaller
    def install_command
      "brew cask install"
    end
  end
end
