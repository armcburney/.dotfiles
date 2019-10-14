# frozen_string_literal: true

require_relative "base"

module Generators
  class ModelGenerator < Generators::BaseGenerator
    def generate!(file_name, parameters)
      class_name = file_name.split("_").map(&:capitalize).join
      file_contents = file_template(class_name, parameters)
      file_path = File.join(Dir.home, ".dotfiles/bin/models", "#{file_name}.rb")
      FileHelpers.write_file(file_path, file_contents)
    end

    private

    def file_template(class_name, parameters)
      attr_readers = parameters
        .map { |p| "    # @return []\n    attr_reader :#{p}\n" }
        .join("\n")

      required_parameters = parameters
        .map { |p| "#{p}:" }
        .join(", ")

      set_parameters = parameters.map do |p|
        whitespace = " " * (longest_parameter_length(parameters) - p.length)
        "      @#{p}#{whitespace} = #{p}"
      end.join("\n")

      <<~FILE_TEMPLATE
        # frozen_string_literal: true

        require_relative "base"

        module Model
          class #{class_name} < Model::Base
        #{attr_readers}
            def initialize(#{required_parameters})
        #{set_parameters}
            end
          end
        end
      FILE_TEMPLATE
    end

    def longest_parameter_length(parameters)
      @longest_parameter_length ||= parameters.max_by(&:length).size
    end
  end
end
