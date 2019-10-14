# frozen_string_literal: true

require_relative "../generators/model_generator"
require_relative "script"

module Scripts
  class Generate_model < Script
    def self.description
      "Generates a new model."
    end

    def self.execute!(params = {})
      Error.not_enough_arguments(1) if params[:name].nil?

      generator = Generators::ModelGenerator.new
      generator.generate!(params[:name], params[:parameters] || [])
    end
  end
end
