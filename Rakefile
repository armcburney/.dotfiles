# frozen_string_literal: true

require "rake"
require "yaml"

BLACKLISTED_FILES = %w[. .. .git .gitignore .DS_Store README.org metadata.yml]
BLACKLISTED_DIRS  = %w[bin].map { |dir| File.join(Dir.pwd, dir) }

# generate_readme takes in a directory or file and writes out the README.org
# that corresponds with said directory.
#
# @param [File] dir
def generate_readme(dir)
  return if File.file?(dir)

  metadata_file_path = File.join(dir, "metadata.yml")
  metadata = YAML.load_file(metadata_file_path) if File.exist?(metadata_file_path)

  readme_lines = ["* =#{dir.gsub(Dir.home, '')}="]
  readme_lines << metadata["description"] if metadata
  readme_lines = append_structure_lines(readme_lines, dir)

  Dir
    .entries(dir)
    .sort_by { |file| [File.file?(file) ? 1 : 0, File.basename(file)] }
    .each do |file|
      next if BLACKLISTED_FILES.include?(file)

      file_path = File.join(dir, file)
      file_name = file_path.gsub(Dir.home, "")
      readme_lines << "*** =#{file_name}="

      basename  = File.basename(file_path)

      file_desc = metadata.dig("files", basename) if metadata

      if File.file?(file_path)
        readme_lines << file_desc
      else
        dir_desc = generate_readme(file_path)
        readme_lines << (dir_desc ? dir_desc : file_desc)
      end
    end

  # Don't write the README.org if it's a special directory.
  return if BLACKLISTED_DIRS.include?(dir)

  readme_lines << metadata["footer"] if metadata
  write_readme_file(dir, readme_lines)

  return metadata["description"] if metadata
end

def append_structure_lines(readme_lines, dir)
  command = tree_command(dir)
  readme_lines << "** Structure"
  readme_lines << "#+BEGIN_SRC bash"
  readme_lines << "$ #{command}"
  readme_lines << ""
  readme_lines << `#{command}`
  readme_lines << "#+END_SRC"
end

def tree_command(dir)
  "tree -a -x -L 2 -I '.git*|LICENSE|README.org|metadata.yml' --dirsfirst #{dir}"
end

# write_readme_file writes a README.org file metadata for a given directory.
#
# @param [File]          dir
# @param [Array[String]] readme_lines
def write_readme_file(dir, readme_lines)
  readme_file_path = File.join(dir, "README.org")
  readme_content   = readme_lines.compact.join("\n")
  File.write(readme_file_path, readme_content)
end

desc "generates the README.org files for each directory recursively"
task :generate do
  generate_readme(Dir.pwd)
end
