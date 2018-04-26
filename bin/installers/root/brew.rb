# frozen_string_literal: true

require_relative "../package_installer"

module SetUp
  class Brew < PackageInstaller
    # Install homebrew
    def pre_install!
      system("/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"")
    end
  end
end
