# coding: utf-8
# frozen_string_literal: true

require "json"
require_relative "ui"

# File utility functions for my scripts.
module FileHelpers
  module_function

  # Writes a file to a path and prints an error message if has a problem writing it.
  #
  # @param [String] file_path
  # @param [String] file_content
  def write_file(file_path, file_contents)
    File.write(file_path, file_contents)
  rescue Errno::ENOENT => e
    UI.error("Error writing file #{file_path}! 😳\n\t#{e}")
  end

  # Reads a file and prints an error message if has a problem opening it.
  #
  # @param [String] file_path
  # @param [Boolean] json
  def read_file(file_path, json: false)
    file_contents = File.read(file_path)
    return JSON.parse(file_contents) if json

    file_contents
  rescue JSON::ParserError => e
    UI.error("Error parsing JSON file #{file_path}! 😳\n\t#{e}")
  rescue Errno::ENOENT => e
    UI.error("Error reading file #{file_path}! 😳\n\t#{e}")
  end

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
