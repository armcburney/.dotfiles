# coding: utf-8
# frozen_string_literal: true

require_relative "script"

module Scripts
  class Gh < Script
    def self.description
      "Opens a project in the ~/gh directory interactively."
    end

    def self.execute!(_params = {})
      # 1. List the projects in the GitHub directory.
      # 2. Allow the user to select the repo interactively using numbers.
      # 3. Open the file in emacs or an client belonging to the emacs instance.

      project_path = Const::Directory::GITHUB

      loop do
        # Break interactive mode once a file is selected.
        break if File.file?(project_path)

        # List each of the files and directories in `project_path`.
        dir_contents = FileHelpers.dir_contents(project_path)
        message = dir_contents.map.with_index { |f, i| "#{i}: #{f}" }.join("\n")
        UI.message(message)

        # Ask the user which file or directory they'd like to select.
        dir_size = dir_contents.size - 1
        i = UI.input("Which directory to traverse? [0, #{dir_size}] ").to_i
        project_path = File.join(project_path, dir_contents[i])
      end

      FileHelpers.open_file!(project_path)
    rescue IndexError, TypeError => e
      UI.error("Error indexing array, out of bounds! 😳\n\t#{e}")
    end
  end
end
