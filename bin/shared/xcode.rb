require "xcodeproj"

module XCode
  class Project
    # The XCode project representation.
    #
    # @return [Xcodeproj::Project]
    attr_reader :project

    # Initializes a new XCode project class representation.
    #
    # @param [String] path
    #        The path to the `.xcodeproj` file (i.e.
    #        "Documents/interlude/interlude.xcodeproj")
    def initialize(path)
      project_path = File.join(Dir.home, path)
      @project = Xcodeproj::Project.open(project_path)
    rescue => e
      UI.error("Encountered error initializing XCode project for #{path}: #{e}")
    end

    # Adds something to a group in the project
    #
    # @param [String] group_name
    #        The name of the group you wish to add to.
    #
    # @param [String] path
    #        The path to the file or directory you wish to add to the project.
    def add!(path:, group_name:, target_name: nil)
      dir    = File.join(Dir.home, path)
      group  = get_group(name: group_name)
      target = get_target(name: target_name)

      if File.directory?(dir)
        files = FileHelpers.dir_contents(dir)
        references = files.map { |file| group.new_file(File.join(dir, file)) }
        target.add_file_references(references)
      else
        reference = group.new_file(dir)
        target.add_file_references([reference])
      end

      project.save
    rescue => e
      UI.error("Encountered error adding to #{group_name}: #{e}")
    end

    # Returns a group corresponding to a `name` if it exists in the project.
    #
    # @param  [String] name
    #         The name of the group we're looking up.
    #
    # @return [PBXGroup]
    def get_group(name:)
      recursive_get_group(name: name, group: project.main_group)
    end

    # Returns a target corresponding to a `name` if it exists in the project.
    #
    # @param  [String] name
    #         The name of the target we're looking up.
    #
    # @return [PBXNativeTarget]
    def get_target(name:)
      # Use the first target if no target name is provided.
      return project.targets.first if name.nil?

      # Find the target corresponding to the target name.
      project.targets.find { |t| t.name == name }
    end

    private

    def recursive_get_group(name:, group:)
      # Group not found in this subtree.
      return if group.nil? || group.is_a?(String)

      # Found the group we want.
      return group if group.path == name

      group.children.each do |c|
        needle = recursive_get_group(name: name, group: c)
        break needle unless needle.nil?
      end
    end
  end
end
