# frozen_string_literal: true

require_relative "package_installer"

module SetUp
  class Yarn < PackageInstaller
    def install_command
      "#{snake_case_name} global add"
    end
  end
end
