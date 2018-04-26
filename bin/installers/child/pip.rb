# frozen_string_literal: true

require_relative "../package_installer"

module SetUp
  class Pip < PackageInstaller
    def pre_install!
      system("pyenv virtualenv #{config[:version]} my-#{config[:version]}")
      system("pyenv activate my-#{config[:version]}")
    end
  end
end
