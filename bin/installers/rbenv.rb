# frozen_string_literal: true

require_relative "package_installer"

module SetUp
  class Rbenv < PackageInstaller
    def options
      %w[-s]
    end
  end
end
