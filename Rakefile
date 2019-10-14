# frozen_string_literal: true

require "rake"
require_relative "bin/generators/readme_generator"

desc "generates the README.org files for each directory recursively"
task :generate do
  generator = Generators::ReadmeGenerator.new
  generator.generate!(Dir.pwd)
end

task default: %i(generate)
