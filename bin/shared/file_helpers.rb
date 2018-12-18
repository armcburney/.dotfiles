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
      system("emacsclient -c #{file_path}")
    end
  rescue Errno::ENOENT => e
    UI.error("Error opening file #{file_path}! 😳\n\t#{e}")
  end

  # Opens a directory and returns the contents in an array.
  #
  # @param [String] dir_path
  # @return [Array[String]]
  def dir_contents(dir_path)
    Dir
      .entries(dir_path)
      .select { |p| p != "." && p != ".." }
  rescue Errno::ENOENT => e
    UI.error("Error opening directory #{dir_path}! 😳\n\t#{e}")
  end
end
