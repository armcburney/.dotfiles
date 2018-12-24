# frozen_string_literal: true

require_relative "script"

module Scripts
  class Goals < Script
    def self.description
      "Opens the README.org for my goals directory."
    end

    def self.execute!(_params = {})
      FileHelpers.open_file!(Const::Org::GOALS_README_PATH)
    end
  end
end
