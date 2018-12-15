# frozen_string_literal: true

require_relative "base"
require_relative "goal"

module Model
  class Category < Model::Base
    # @return [String]
    attr_reader :name

    # @return [Array[Model::Goal]]
    attr_accessor :goals

    def initialize(name:, goals:)
      @name  = name
      @goals = goals
    end
  end
end
