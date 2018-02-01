# frozen_string_literal: true

require_relative "logging.rb"
require_relative "packages.rb"

module SetUp
  class Installer
    include Logging
    include Packages

    def all
      setup
      packages(brew: true, cask: true, yarn: true, pip: true)
      install_spacemacs(private: true, skeletons: true)
      emacs_private
      skeletons
      rbenv
    end

    def setup
      logger.info "SETUP - initial setup.".colorize(:magenta)
      `
        # Install command line tools
        xcode-select --install

        # Install and update brew
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew tap homebrew/versions
        brew update

        # Install zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

        # Install other packages
        sudo easy_install pip
      `
    end

    def packages(options)
      # logger.info "INSTALL - installing brew cask packages.".colorize(:yellow)
      # Packages::CASK.each { |package| `brew cask install #{package}` } if options[:cask]

      logger.info "INSTALL - installing brew packages.".colorize(:yellow)
      Packages::BREW.each { |package| `brew install #{package}` } if options[:brew]

      # logger.info "INSTALL - installing yarn packages.".colorize(:yellow)
      # Packages::YARN.each { |package| `yarn global add #{package}` } if options[:yarn]

      logger.info "INSTALL - installing pip packages.".colorize(:yellow)
      Packages::PIP.each { |package| `pip install #{package}` } if options[:pip]
    end

    def install_spacemacs(options)
      logger.info "INSTALL - installing spacemacs.".colorize(:green)
      `
        brew tap d12frosted/emacs-plus
        brew install emacs-plus --HEAD --with-natural-title-bars
        brew linkapps emacs-plus
        git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
      `

      emacs_private if options[:private]
      skeletons     if options[:skeletons]
    end

    def emacs_private
      logger.info "INSTALL - installing emacs private repo.".colorize(:green)
      `
        git clone git@github.com:AndrewMcBurney/emacs.d.git ~/.emacs.d/private/
        git clone git@github.com:emerald-lang/emerald-emacs.git ~/.emacs.d/private/emerald
        git clone git@github.com:juanedi/crystal-spacemacs-layer.git ~/.emacs.d/private/crystal
      `
    end

    def skeletons
      %w[
        express-pug-sass-ts
        rails-es6
        ruby-cli-activerecord
        sinatra-slim-sass-coffee
      ].each do |skeleton|
        logger.info "CLONE - cloning skeleton #{skeleton} from GitHub.".colorize(:blue)
        `git clone git@github.com:AndrewMcBurney/#{skeleton}.git ~/.emacs.d/private/skeletons/#{skeleton}`
      end
    end

    def rbenv
      Packages::RUBY_VERSIONS.each do |version|
        logger.info "INSTALL - installing ruby #{version}.".colorize(:green)
        `
          rbenv install #{version}
          rbenv shell #{version}
          rbenv rehash
          gem install bundler #{version}
          gem install rubocop
        `
      end
    end
  end
end
