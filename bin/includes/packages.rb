# frozen_string_literal: true

module SetUp
  module Packages
    BREW = %w[
      apache-spark
      boost
      cask
      cmake
      crystal-lang
      docker
      docker-compose
      dockutil
      elasticsearch
      elixir
      gcc48
      git
      go
      heroku
      hub
      imagemagick
      ispell
      llvm
      lua
      maven
      mysql
      node
      nvm
      openssl
      postgresql
      pyenv
      pyenv-virtualenv
      pygtk
      python
      python3
      r
      rbenv
      rbenv-gemset
      redis
      ruby
      ruby-build
      sbt
      scala
      scalafmt
      scalastyle
      sqlite
      the_silver_searcher
      tree
      valgrind
      wget
    ].freeze

    CASK = %w[
      caffeine
      google-chrome
      google-drive
      java
      iterm2
      kindle
      omnigraffle
      slack
      spotify
      virtualbox
    ].freeze

    YARN = %w[
      jshint
      coffeelint
      grunt-cli
      typescript
      tslint
      jsxhint
      js-beautify
      tern
      bower
      eslint
      eslint-plugin-jsx-a11y
      prettier
      import-js
      babel-cli
      babel-preset-es2015
      save-dev babel-preset-react
      babel-preset-stage-0
    ].freeze

    PIP = %w[
      virtualenv
    ].freeze
  end
end
