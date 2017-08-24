# frozen_string_literal: true

require_relative "packages.rb"

module SetUp
  module Install
    include Packages

    module_function

    def all
      setup
      packages
      spacemacs
      emacs_private
      skeletons
      dotfiles
    end

    def setup
      # Install command line tools
      `xcode-select --install`

      # Install and update brew
      `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
      `brew tap homebrew/versions`
      `brew update`

      # Install zsh
      `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
      `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`

      # Install other packages
      `sudo easy_install pip`
    end

    def packages(options)
      Packages::BREW.each { |package| `brew install #{package}` }      if options[:brew]
      Packages::CASK.each { |package| `brew cask install #{package}` } if options[:cask]
      Packages::YARN.each { |package| `yarn global add #{package}` }   if options[:yarn]
      Packages::PIP.each  { |package| `pip install #{package}` }       if options[:pip]
    end

    def install_spacemacs(options)
      `brew tap d12frosted/emacs-plus`
      `brew install emacs-plus --HEAD --with-natural-title-bars`
      `brew linkapps emacs-plus`
      `git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d`

      emacs_private if options[:private]
      skeletons     if options[:skeletons]
    end

    def emacs_private
      `git clone git@github.com:AndrewMcBurney/emacs.d.git ~/.emacs.d/private/`
      `git clone git@github.com:emerald-lang/emerald-emacs.git ~/.emacs.d/private/emerald`
      `git clone git@github.com:juanedi/crystal-spacemacs-layer.git ~/.emacs.d/private/crystal`
    end

    def skeletons
      %w[
        express-pug-sass-ts
        rails-es6
        ruby-cli-activerecord
        sinatra-slim-sass-coffee
      ].each do |skeleton|
        `git clone git@github.com:AndrewMcBurney/#{skeleton}.git ~/.emacs.d/private/skeletons/#{skeleton}`
      end
    end

    def rbenv
      Packages::RUBY_VERSIONS.each do |version|
        `rbenv install #{version}`
        `rbenv shell #{version}`
        `gem install bundler #{version}`
      end
    end
  end
end
