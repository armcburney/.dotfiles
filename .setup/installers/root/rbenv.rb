# frozen_string_literal: true

require_relative "../package_installer"
require_relative "../child/gem"

module SetUp
  class Rbenv < PackageInstaller
    def initialize
      super(nil, [Gem.new(self)], %w[-s])
    end
  end
end
