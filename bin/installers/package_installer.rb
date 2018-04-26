# frozen_string_literal: true

require_relative "../string"

module SetUp
  class PackageInstaller
    def install_packages!
      pre_install!
      packages.each { |package| install!(package) }
      post_install!
    end

    def install_command
      "#{snake_case_name} install #{options.join(" ")}"
    end

    def options
      []
    end

    private

    def pre_install!
      puts "No pre-install script defined for #{snake_case_name}."
    end

    def install!(package)
      puts "#{install_command} #{package}"
      system("#{install_command} #{package}")
    end

    def post_install!
      puts "No post-install script defined for #{snake_case_name}."
    end

    def packages
      File.read("./packages/#{snake_case_name}.txt").split("\n")
    end

    def snake_case_name
      self.class.name.split("::").last.underscore
    end
  end
end
