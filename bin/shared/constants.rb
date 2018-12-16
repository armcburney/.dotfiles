# frozen_string_literal: true

module Const
  # EC2 constants.
  module EC2
    WORKSTATION = "ubuntu@ec2-18-206-179-19.compute-1.amazonaws.com"
    PEM = File.join(Dir.home, "ec2/andrew-workstation.pem")
  end

  # Org-mode constants.
  module Org
    GOALS_PATH = File.join(Dir.home, "me/goals")
    GOALS_README_PATH = File.join(GOALS_PATH, "README.org")
    GOALS_REPORTS_PATH = File.join(GOALS_PATH, "reports")
  end

  # Dotfiles constants.
  module Dotfiles
    PATH = File.join(Dir.home, ".dotfiles")

    module Emacs
      PATH = File.join(Dotfiles::PATH, "+emacs")
      PRIVATE_PATH = File.join(PATH, "private")
      SPACEMACS_PATH = File.join(PATH, ".spacemacs")
    end

    module Zsh
      PATH = File.join(Dotfiles::PATH, "+zsh")
      RC_PATH = File.join(PATH, ".zshrc")
      ENV_PATH = File.join(PATH, ".zshenv")
    end

    module Ruby
      PATH = File.join(Dotfiles::PATH, "+ruby")
      RUBOCOP_PATH = File.join(PATH, ".rubocop.yml")
    end
  end
end
