# frozen_string_literal: true

require_relative "base"

module Model
  class Goal < Model::Base
    # @return [String]
    attr_reader :name

    # @return [String]
    attr_reader :description

    # @return [Model::Date]
    attr_reader :date

    def initialize(name:, description:, date:)
      @name        = name
      @description = description
      @date        = date
    end
  end
end
