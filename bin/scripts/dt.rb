# frozen_string_literal: true

require "date"
require_relative "script"

module Scripts
  class Dt < Script
    def self.description
      "Converts a timestamp to date."
    end

    def self.execute!(params = {})
      Error.not_enough_arguments(1) if params[:timestamp].nil?

      timestamp = params[:timestamp].to_i
      date = Time.at(timestamp).to_datetime

      UI.message(date)
    end
  end
end
