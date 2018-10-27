# frozen_string_literal: true

require_relative "../string"

module SetUp
  class PackageInstaller
    attr_reader :parent, :children, :options

    def initialize(parent = nil, children = [], options = [])
      @parent   = parent
      @children = children
      @options  = options
    end

    def install_packages!(config: {})
      @config = config
      pre_install!

      packages.each do |package|
        install!(package)
        children.each { |child| child.install_packages!(config: { version: package }) }
      end

      post_install!
    end

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

    def install_command
      "#{snake_case_name} install #{options.join(" ")}"
    end

    private

    attr_reader :config

    def packages
      File.read("./packages/#{snake_case_name}.txt").split("\n")
    end

    def snake_case_name
      self.class.name.split("::").last.underscore
    end
  end
end
