# coding: utf-8
# frozen_string_literal: true

require_relative "ui"

# File utility functions for my scripts.
module FileHelpers
  module_function

  # Opens a file with the currently running emacs instance or creates a new
  # emacs instance and opens the file if one does not exist.
  #
  # @param [String] file_path
  def open_file!(file_path)
    if ENV["INSIDE_EMACS"].nil?
      system("emacs -nw #{file_path}")
    else
      system("emacsclient #{file_path}")
    end
  rescue Error
    UI.error("Error opening #{file_path}! 😳")
  end
end
