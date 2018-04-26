# frozen_string_literal: true

module SetUp
  class Pip < Package
    # Install pip
    def pre_install!
      system("sudo easy_install pip")
    end
  end
end
