# frozen_string_literal: true

require_relative "../package_installer"

module SetUp
  class Gem < PackageInstaller
    # Install gems for a ruby version
    def pre_install!
      system("rbenv install -s #{config[:version]}")
      system("rbenv shell #{config[:version]}")
      system("rbenv rehash")
    end
  end
end
