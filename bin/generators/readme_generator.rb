# frozen_string_literal: true

require "yaml"

# ReadmeGenerator is a class to generate `README.org`s for a given directory
# recursively.
class ReadmeGenerator
  # Load all of the scripts from the `bin/scripts` directory.
  Dir[File.join(__dir__, "../scripts", "*.rb")].each { |file| require file }

  # Files that should be ignored when generating the README.org.
  BLACKLISTED_FILES = %w[
    . .. .git .gitignore .DS_Store LICENSE README.org metadata.yml
  ]

  # generate_readme takes in a directory or file and writes out the README.org
  # that corresponds with said directory.
  #
  # @param [File] dir
  def self.generate_readme(dir, blacklisted_dirs = [], script: false)
    return if File.file?(dir)

    metadata_file_path = File.join(dir, "metadata.yml")
    metadata = File.exist?(metadata_file_path) ? YAML.load_file(metadata_file_path) : {}

    readme_lines = ["* =#{dir.gsub(Dir.home, '')}="]
    readme_lines << metadata["description"]
    readme_lines = append_structure_lines(dir, readme_lines)

    Dir
      .entries(dir)
      .sort_by { |file| [File.file?(file) ? 1 : 0, File.basename(file)] }
      .each do |file|
        next if BLACKLISTED_FILES.include?(file)

        file_path = File.join(dir, file)
        file_name = file_path.gsub(Dir.home, "")
        basename  = File.basename(file_path)
        readme_lines << "*** =#{file_name}="

        file_desc = get_file_desc(basename, metadata, script && File.file?(file_path))
        if File.file?(file_path)
          readme_lines << file_desc
        else
          dir_desc = generate_readme(
            file_path, blacklisted_dirs, script: basename == "bin"
          )
          readme_lines << (dir_desc ? dir_desc : file_desc)
        end
      end

    # Don't write the README.org if it's a special directory.
    return if blacklisted_dirs.include?(dir)

    readme_lines << metadata["footer"]
    write_readme_file(dir, readme_lines)

    metadata["description"]
  end

  # append_structure_lines appends lines for the structure of the current
  # directory, with output from the `tree` command.
  #
  # @param [File]          dir
  # @param [Array[String]] readme_lines
  def self.append_structure_lines(dir, readme_lines)
    readme_lines << "** Structure"
    readme_lines << "#+BEGIN_SRC bash"
    readme_lines << "$ #{tree_command(normalize_home_path(dir), with_options: false)}"
    readme_lines << ""
    readme_lines << normalize_home_path(`#{tree_command(dir)}`)
    readme_lines << "#+END_SRC"
  end

  # tree_command is the string representation for the `tree` command executed in
  # append_structure_lines.
  #
  # @param  [File]    dir
  # @param  [Boolean] with_options
  # @return [String]
  def self.tree_command(dir, with_options: true)
    options = "-a -x -L 2 -I '.git*|.DS_Store|LICENSE|README.org|metadata.yml' --dirsfirst"
    with_options ? "tree #{options} #{dir}" : "tree #{dir}"
  end

  # get_file_desc returns the file description for the file to append to the README.
  #
  # @param  [String]  basename
  # @param  [Hash]    metadata
  # @param  [Boolean] script
  # @return [String]
  def self.get_file_desc(basename, metadata, script)
    return metadata.dig("files", basename) unless script

    class_name = "Scripts::" + basename.split("-").map(&:capitalize).join
    klass = Object.const_get(class_name)
    klass.description
  end

  # write_readme_file writes a README.org file metadata for a given directory.
  #
  # @param [File]          dir
  # @param [Array[String]] readme_lines
  def self.write_readme_file(dir, readme_lines)
    readme_file_path = File.join(dir, "README.org")
    readme_content   = readme_lines.compact.join("\n")
    File.write(readme_file_path, readme_content)
  end

  # normalize_home_path substitutes any home path occurrences in text with the string "~".
  #
  # @param [File]          dir
  # @param [Array[String]] readme_lines
  def self.normalize_home_path(text)
    text.gsub(Dir.home, "~")
  end
end
