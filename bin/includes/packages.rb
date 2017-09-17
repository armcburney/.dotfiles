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
      glfw3
      glm
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
    ]

    CASK = %w[
      atom
      dash
      firefox
      font-source-code-pro
      font-source-code-pro-for-powerline
      gimp
      google-chrome
      google-drive
      google-hangouts
      hammerspoon
      java
      iterm2
      kindle
      mysql-utilities
      ngrok
      opera-neon
      rstudio
      slack
      spotify
      xquartz
      vagrant
      vagrant-manager
      virtualbox
    ]

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
    ]

    PIP = %w[
      virtualenv
    ]

    RUBY_VERSIONS = %w[
      2.3.2
      2.4.0
      2.4.1
    ]
  end
end
