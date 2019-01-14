# frozen_string_literal: true

require_relative "script"

module Scripts
  class XcodeAdd < Script
    def self.description
      "Adds a file or directory to an XCode group for a given project path."
    end

    def self.execute!(params = {})
      project_path  = params[:project]
      group_name    = params[:group]
      dir_path      = params[:directory]
      xcode_project = XCode::Project.new(project_path)
      xcode_project.add!(path: dir_path, group_name: group_name)
    end

    def self.usage
      "#{script_name} <project_path> <group_name> <directory_path>"
    end

    def self.macOS_only?
      true
    end
  end
end
