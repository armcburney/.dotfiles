# frozen_string_literal: true

require "rake"
require_relative "bin/generators/readme_generator"

desc "generates the README.org files for each directory recursively"
task :generate do
  ReadmeGenerator.generate_readme(Dir.pwd)
end
